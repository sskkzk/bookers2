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
    @books = Book.all 
    @user = User.find_by(params[:id])
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save# もし保存ができたら
    flash[:notice] = "You have created book successfully."
    redirect_to book_url(@book)  # 投稿画面に遷移show
    else  # できなければ
    render :index
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    # ログインしていない場合はログイン画面へリダイレクト
  unless current_user
    redirect_to auth_login_path
  end

  # ユーザーが所有していない投稿の場合はエラー
  unless current_user.id == book.user_id
    flash[:error] = "あなたはこの投稿を編集できません。"
    redirect_to "/books"
  end
  end
  
  def update
    book = Book.find(params[:id])
      if book.update(book_params)
      flash[:notice] = "You have update book successfully."
      redirect_to book_path(book.id)
      else
      @book = book
      render :edit
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
