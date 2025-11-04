class OrderMailer < ApplicationMailer
    def order_confirmation
      @order = params[:order]
      @items = params[:items]
      mail(to: @order.email, subject: 'Order Confirmation')
    end
  end