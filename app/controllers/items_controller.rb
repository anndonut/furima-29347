class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  before_action :find_id, except:[:index, :create,:new]
  

  

  def show
    @item = Item.find(params[:id]) 
  end

  def edit
    # @item = Item.find(params[:id]) >>before_actionとして集約
    if user_signed_in? && current_user.id == @item.user_id
      edit_item_path
    else
      render :edit
    end
  end

  def update
    # @item = Item.find(params[:id]) >>before_actionとして集約
    @item.update(item_params)
    if user_signed_in? && current_user.id == @item.user_id
      if @item.valid?
      redirect_to root_path
      else
       render :edit
      end
    end
  end 

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
      if @item.destroy
       redirect_to root_path
      else
       render :show
      end
     else
       render :show
     end
  end


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def find_id
    @item = Item.find(params[:id])
  end 

end

