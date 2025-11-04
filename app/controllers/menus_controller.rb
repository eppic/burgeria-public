class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  # GET /menus or /menus.json
  def index
    @menus = Menu.all
    @menu_images = @menus.each_with_object({}) do |menu, hash|
      hash[menu.id] = menu.items.sample&.image.present? ? "menu/#{menu.items.sample.image}" : "placeholder.jpg"
    end
  end

  # GET /menus/1 or /menus/1.json
  def show
    @menu
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit
  end

  # POST /menus or /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: "Menu was successfully created." }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1 or /menus/1.json
  def update
    if @menu.update(menu_params)
      redirect_to @menu, notice: "Menu was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /menus/1 or /menus/1.json
  def destroy
    @menu.destroy
    redirect_to menus_url, notice: "Menu was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def menu_params
      params.require(:menu).permit(:name)
    end
end
