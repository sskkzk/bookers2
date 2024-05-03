class UsersController < ApplicationController
 def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = @user.books
   @users = User.all
 end
 
 def index
  @user = current_user
  @book = Book.new
  @users = User.all  # ユーザ一覧を取得 (例)
 end
 
def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    if params[:image].present?
      @user.image.attach(params[:image])
    end
    redirect_to @user, notice: "ユーザー情報を更新しました。"
  else
    render :edit
  end
end

private

  def user_params
    params.require(:user).permit(:title, :image, :body )
  end
end
