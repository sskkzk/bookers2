class Book < ApplicationRecord
  validates :title, :body, presence: true
  # ... other validations
  # has_one_attached :image  # Paperclip or Shrineなどのライブラリを使用
  # ... other methods
  belongs_to :user
  
  has_one_attached :image

  def self.default_image
    Rails.root.join('app/assets/images/no_image.jpg')
  end

  def get_image
    image ||= Book.default_image # image が nil ならば Book.default_image を代入
    # ... (既存の処理)
  end
  
  
 
end
