class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,:first_name,:family_name,:first_name_kana, :family_name_kana,:birth_day ,presence: true
  # validates :password,presence:true,length:{minimum:6}
  # validates :password, confirmation: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end

  with_options presence: true, format: { with: /\A[ｧ-ﾝﾞﾟ]+\z/, message: '全角文字(カナ)を使用してください' } do
    validates :first_name_kana
    validates :family_name_kana
  end

  with_options presence: true, format: { with:/\A[0-9]+\z/, message: '生年月日を入力してください' } do
    validates :birth_day
  end
end
