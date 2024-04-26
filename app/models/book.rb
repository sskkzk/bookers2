class Book < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  # ... other validations
  # has_one_attached :image  # Paperclip or Shrineなどのライブラリを使用
  # ... other methods
  belongs_to :user
 
end
