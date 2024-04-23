class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def index
    @books = Book.all 
  end
  
   # 投稿データの保存
  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
     redirect_to '/books'
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :image, :body )
  end
  
end
