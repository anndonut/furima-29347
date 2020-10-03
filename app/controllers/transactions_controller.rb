class TransactionsController < ApplicationController
  before_action :find_id, except:[:new]

  def create
    @transaction = TransactionDistination.new(transaction_params)
    if @transaction.valid?
      @transaction.save
      pay_item
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def index
    @transaction = TransactionDistination.new
    if user_signed_in? && current_user.id == @item.user_id
      render :show
    end
  end

  private
  def item_params
    params.permit(
      :item_id
    ).merge(user_id: current_user.id)
  end

  def transaction_params
    params.permit(
      :post_code,
      :prefecture_code_id,
      :city,
      :house_number,
      :building_name,
      :phone_number,
      :transaction,
      :token,
      :item_id
    ).merge(user_id:current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_803d1b6752386f6b1f6f7ddd"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.selling_price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
end


  def find_id
    @item = Item.find(params[:item_id])
  end 

end



 

