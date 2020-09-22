class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :itemn_customers
         has_many :items, through:  :itemn_customers

         validates :email.match(/@+/), presence: true

         validates :password.match(/[a-z\d]{8,}/i), presence: true 

         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
          validates :family_name
          validates :first_name
         end

         with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください' } do
          validates :family_name_kana
          validates :first_name_kana
         end
end
