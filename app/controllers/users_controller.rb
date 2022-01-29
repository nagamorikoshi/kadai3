class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)  
    else
      render :edit
    end
  end
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  
  private
  
  
  def user_params
    params.require(:user).permit(:image, :name, :introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user)) unless @user == current_user
    
    # unless @user==current_user
    #   redirect_to user_path(current_user)
  end
  
end
