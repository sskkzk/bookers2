class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  # ... other validations
  # has_one_attached :image  # Paperclip or Shrineなどのライブラリを使用
  # ... other methods
  belongs_to :user
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
