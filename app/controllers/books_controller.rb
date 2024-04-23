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
    if @book.save# もし保存ができたら
    redirect_to '/books/new'  # 投稿画面に遷移
    else  # できなければ
    render :new  # newに遷移
    end
  end
  
   private

  def book_params
    params.require(:book).permit(:title, :image, :body )
  end
  
end
