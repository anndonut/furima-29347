class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end 
  end

  private 
    
  def item_params
    params.require(:item).permit(
      :category_id,
      :condition_id,
      :shipping_expense_id,
      :ship_from_area_id,
      :processing_time_id,
      :name,
      :introduction,
      :selling_price,
      :image
    ).merge(user_id: current_user.id)
  end
end

