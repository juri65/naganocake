class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end 
  
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    redirect_to customers_my_page_path
  end 
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:address,:postcode,:phone_number,:is_deleted)
  end 
  
end
