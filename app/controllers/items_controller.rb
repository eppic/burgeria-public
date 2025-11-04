class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_path, status: :see_other, notice: "Dein Gericht wurde erfolgreich entfernt." }
      format.json { head :no_content }
    end
  end

  def add_to_cart
    cart = cookies.signed[:cart] ? JSON.parse(cookies.signed[:cart], symbolize_names: true) : []

    item_id = params[:id].to_i
    amount = params[:amount].to_i
    amount = 1 if amount < 1
    amount = 99 if amount > 99

    existing_item = cart.find { |item| item[:id] == item_id }

    if existing_item
      if amount > 0
        existing_item[:amount] = amount
      else
        cart.delete(existing_item)
      end
    else
      cart << { id: item_id, amount: amount }
    end

    cookies.signed[:cart] = { value: cart.to_json, expires: 1.week.from_now }

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to item_path(item_id) }
    end
  end

  def remove_from_cart
    cart = cookies.signed[:cart] ? JSON.parse(cookies.signed[:cart]) : []
    cart.reject! { |item| item["id"] == params[:id].to_i }
    cookies.signed[:cart] = { value: cart.to_json, expires: 1.week.from_now }

    flash[:notice] = "Item removed from cart."
    redirect_to show_cart_path
  end

  def show_cart
    cart = cookies.signed[:cart] ? JSON.parse(cookies.signed[:cart]) : []
    item_ids = cart.map { |item| item["id"] }
    @items = Item.where(id: item_ids)

    @items.each do |item|
      cart_item = cart.find { |c| c["id"] == item.id }
      item.amount = cart_item["amount"] if cart_item
    end
  end

  def checkout
    @order = Order.new
  end

  def complete_order
    @order = Order.new(order_params)
    cart_items = JSON.parse(cookies.signed[:cart], symbolize_names: true)

    if @order.save
      OrderMailer.with(order: @order, items: cart_items).order_confirmation.deliver_now
      cookies.delete(:cart)
      flash[:notice] = "Danke für deine Bestellung!"
      redirect_to root_path
    else
      render :checkout
    end
  end

  def order_confirmation
    @order = Order.find(params[:order_id])
    @items = JSON.parse(cookies.signed[:cart], symbolize_names: true)
    render "orders/order_confirmation"
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :menu_id)
  end

  def order_params
    params.require(:order).permit(:name, :email, :address, :city, :zip_code)
  end
end
