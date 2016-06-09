class CalorieIntakesController < ApplicationController
# before_action :authorize

def index
  @calorieIntakes = CalorieIntakes.all
end

def show
  @CalorieIntakes = CalorieIntake.find(params[:id])
end

def new
  @calorieIntakes = CalorieIntake.new
end

def create
  @calorieIntakes = CalorieIntake.new(user_params)
  @calorieIntakes.user = current_user
  if @calorieIntakes.save
    redirect_to calorie_intakes_path(@calorieIntakes)
  else
    redirect_to new_calorie_intakes_path
  end
end

def edit
  @calorieIntakes = CalorieIntake.find(params[:id])
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
