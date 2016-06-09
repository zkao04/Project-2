class CalorieIntakesController < ApplicationController
# before_action :authorize

def index
  @calorieIntakes = CalorieIntake.all
end

def show
  @CalorieIntakes = CalorieIntake.find(params[:id])
end

def new
  @calorieIntakes = CalorieIntake.new
end

def create
  @calorieIntakes = CalorieIntake.new(calorieIntakes_params)
  @calorieIntakes.user = current_user
  if @calorieIntakes.save
    redirect_to user_path(current_user)
  else
    redirect_to new_calorie_intake_path
  end
end

def edit
  @calorieIntake = CalorieIntake.find(params[:id])
end

def update
  # @calorieIntakess = CalorieIntake.find(params[:id]
    @calorieIntakes = CalorieIntake.find(params[:id])
    if @calorieIntakes.update_attributes(calorieIntakes_params)
      flash[:success] = "CalorieIntake"
      redirect_to user_path(current_user)
    else
      redirect_to calorieIntakes_path
    end
end

def destroy
end

private
  def calorieIntakes_params
    params.require(:calorie_intake).permit(:date, :breakfast_description, :breakfast, :lunch_description, :lunch, :dinner_description, :dinner, :snack_description, :snack)
  end
end
