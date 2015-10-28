class UsersController < ApplicationController
  def index
    @users = User.all
    @foods = Food.all
    @calories = 0       ##I eventually want this to be computed at the model level
    @foods.each do |food| ## Having trouble, using this as hold-over for now.
      @calories = @calories + food.calories
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
