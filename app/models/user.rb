class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, uniqueness: true
  validates_length_of :name, minimum: 2, maximum: 20
  validates_length_of :introduction, maximum: 50
         
  has_one_attached :profile_image
   # 既存のコード
  belongs_to :book, optional: true # bookモデルとの関連付け
  has_many :books, dependent: :destroy
  
def get_image(width, height)
    
    unless profile_image.attached?
     file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
     profile_image.attach(io: File.open(file_path), filename: 'sample-author1.jpg', content_type: 'image/jpeg')
    end
     profile_image.variant(resize_to_limit: [width, height]).processed
end

end
