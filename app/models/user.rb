class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :itemn_customers
         has_many :items, through:  :itemn_customers

         validates :email, presence: true, format:{ with: /@+/, message: '@マークを含めたアドレスを入力してください' }

         validates :password, presence: true, format:{ with: /[a-z\d]{8,}/i, message: '半角英数字で６文字以上で入力してください' }

         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字で入力してください' } do
          validates :family_name
          validates :first_name
         end

         with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナ文字で入力して下さい' } do
          validates :family_name_kana
          validates :first_name_kana
         end
end
