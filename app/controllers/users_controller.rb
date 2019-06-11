class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@book = Book.new
  	@user = User.find(params[:id])
  	@books = Book.where(user_id: @user.id)
  end

  def index
  	@users = User.all
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  	if @user.id != current_user.id
  		redirect_to user_path(current_user.id)
  	end
  end

  def update
  	 @user = User.find(params[:id])
     if  @user.update(user_params)
     redirect_to user_path(@user.id)
     flash[:update] = "You have editing user successfully."
    else
     render :edit
  end

  end

   private
  	def user_params
      params.require(:user).permit(:name, :image, :introduction,)
    end
   end