class UsersController < ApplicationController
  def index
    @users = User.all
    session[:user_id] ||= 1
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def show
    @user = User.find(params[:id])
    foods = @user.foods.all
    @calories = 0       ##I eventually want this to be computed at the model level
    foods.each do |food| ## Having trouble, using this as hold-over for now.
      @calories = @calories + food.calories
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end
end
