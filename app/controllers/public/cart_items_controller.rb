class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end
  
  def create
    @cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
    if @cart_item.present?
      new_quantity = @cart_item.quantity + params[:cart_item][:quantity].to_i
      @cart_item.update(quantity: new_quantity)
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
      redirect_to cart_items_path
    end 
  end 
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end 
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
  end 
  
  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end 
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end 
  
end
