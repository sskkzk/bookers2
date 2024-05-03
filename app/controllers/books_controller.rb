class BooksController < ApplicationController
  # before_action :ensure_user, only: [:edit, :update, :destroy]
   # @book = Book.find(params[:id])
  def new
    @user = current_user
    @book = Book.new
  end
  
  def show
    @user = User.find_by(params[:id])
    @book = Book.new
    @book_main = Book.includes(:user).find(params[:id])
    @books = Book.find(params[:id])
  end
  
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all 
  end
  
   # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save# もし保存ができたら
    redirect_to book_url(@book)  # 投稿画面に遷移show
    else  # できなければ
    
    render :new  # newに遷移
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
      if book.update(book_params)
      redirect_to book_path(book.id)
      else
      render :show
      end
      
  end
  
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to user_path(current_user), notice: "投稿を削除しました。"
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body )
  end
end
