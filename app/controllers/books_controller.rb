class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
   # 投稿データの保存
  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
    # redirect_to post_images_path
  end
  
   private

  def book_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
