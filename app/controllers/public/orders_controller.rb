class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    
    
  end
  
  def create
    cart_items = current_customer.cart_items.all
   # ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
    @order = current_customer.orders.new(order_params)
    # 渡ってきた値を @order に入れます
    if @order.save
      # 念の為IF文で分岐させています
      @cart_items.each do |cart|
        # 取り出したカートアイテムの数繰り返します
        # order_item にも一緒にデータを保存する必要があるのでここで保存します
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.quantity = cart.quantity
        # 購入が完了したらカート情報は削除するのでこちらに保存します
        order_detail.price = cart.item.add_tax_price
        # カート情報を削除するので item との紐付けが切れる前に保存します
        order_detail.save
    end
    redirect_to orders_done_path
    @cart_items.destroy_all 
    else
    @order = Order.new(order_params)
    render :new
    end
  end

  def done
  end

  def index
  end

  def show
  end
  
  def postage
  end 
  
  private
  
  def 
    order_params
    params.require(:order).permit(:name, :address, :postcode, :postage,:price,
  	                              :payment_method, :status,:created_at,
  	                              :customer_id, :item_id, :quantity)
  end 
  
end
