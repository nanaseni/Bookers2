class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_maching_login_user, only: [:edit,:update]

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
   
  end

  def update
    
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private
    def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def is_maching_login_user
      @user= User.find(params[:id])
      unless @user.id == current_user.id
        redirect_to user_path(current_user.id)
      end
    end
end
