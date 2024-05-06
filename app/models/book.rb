class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates_length_of :body, maximum: 200
  # ... other validations
  # has_one_attached :image  # Paperclip or Shrineなどのライブラリを使用
  # ... other methods
  belongs_to :user
  
  has_one_attached :image
   
  def get_image(width, height)
    
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      image.attach(io: File.open(file_path), filename: 'sample-author1.jpg', content_type: 'image/jpeg')
    end
       image.variant(resize_to_limit: [width, height]).processed
  end
end
