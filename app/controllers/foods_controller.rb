class FoodsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @food = @user.foods.new
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.new(food_params)

    @food.save
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @food = @user.foods.find(params[:id])
    @food.destroy
    redirect_to user_path(@user)
  end

  private
  def food_params
    params.require(:food).permit(:name, :calories, :details, :user_id)
  end
end
