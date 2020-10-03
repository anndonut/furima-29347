class TransactionsController < ApplicationController
  before_action :find_id, except:[:create,:new]

  def index
    # @item = Item.new(item_params)
    if user_signed_in? && current_user.id == @item.user_id
      render :show
    # else
    #   render :index 
    end
  end

  private
  def item_params
    params.permit(
      # コントローラーのrequireの記述をなくす
      # permitの中のuser_idを削除、mergeの中のitem_idに関連する記述を削除
      :item_id
    ).merge(user_id: current_user.id)
  end

  def find_id
    @item = Item.find(params[:item_id])
  end 

end
  #itemの情報をわたす


#   def create
#   end
# end
