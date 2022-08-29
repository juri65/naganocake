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
  

  
end
