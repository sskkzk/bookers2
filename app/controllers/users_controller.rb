class UsersController < ApplicationController
before_action :correct_user, only: [:edit, :update ]
  
 def show
   @user = User.find(params[:id])
   @book = Book.new
   @books = @user.books
   @users = User.all
 end
 
 def edit
   @user = current_user
 end
 
 def index
  @user = current_user
  @book = Book.new
  @users = User.all  # ユーザ一覧を取得 (例)
 end
 
def update
  user = User.find(params[:id])
  if user.update(user_params)
    if params[:profile_image].present?
      user.image.attach(params[:profile_image])
    end
    redirect_to user_path(), notice: "successfully"
  else
    @user = user
    render :edit
  end
end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction )
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end
end
