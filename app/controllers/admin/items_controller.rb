class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(5)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end 

  def show
  end

  def edit
  end
  
  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_ordered, :image, :genre_id)
  end 
  
end
