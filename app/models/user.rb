class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :image 
   # 既存のコード
  belongs_to :book, optional: true # bookモデルとの関連付け
  has_many :books, dependent: :destroy
end
