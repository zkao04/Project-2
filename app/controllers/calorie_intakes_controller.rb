class CalorieIntakesController < ApplicationController
# before_action :authorize

def index
  @calorieIntakes = CalorieIntakes.all
end

def show
  @CalorieIntake = CalorieIntake.find(params[:id])
end

def new
  @calorieIntake = CalorieIntake.new
end

def create
  @calorieIntake = CalorieIntake.new(user_params)
  @calorieIntake.user = current_user
  if @calorieIntake.save
    redirect_to calorie_intakes_path(@calorieIntake)
  else
    redirect_to new_calorie_intakes_path
  end
end

def edit
  @calorieIntake = CalorieIntake.find(params[:id])
end

def update
  @calorieIntake = CalorieIntake.find(params[:id])
    # if @calorieIntake.update_attributes(calorieIntakes_params)
    #   flash[:success] = "CalorieIntake"
    #   redirect_to calorieIntakes_path(@calorieIntake)
    # else
    #   redirect_to calorieIntakes_path
    # end
end

def destroy
end

private
def calorieIntakes_params
  params.permit(:breakfast_description, :breakfast, :lunch_description, :lunch, :dinner_description, :dinner, :snack_description, :snack)
end
end
