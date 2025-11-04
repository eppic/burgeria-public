class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :cleanup_orphaned_order
  helper_method :cart_item_count

  private

  def cleanup_orphaned_order
    order_id = cookies.signed[:order_id]

    # If the cookie is missing but an order exists, delete the order
    if order_id && !cookies[:order_id]
      order = Order.find_by(id: order_id)
      order&.destroy
    end
  end

  def cart_item_count
    cart = cookies.signed[:cart] ? JSON.parse(cookies.signed[:cart]) : []
    cart.size
  end
end
