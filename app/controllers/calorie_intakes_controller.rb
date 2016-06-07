class CalorieIntakesController < ApplicationController
# before_action :authorize

def index
  @calorieIntakes = CalorieIntakes.all
end

def show
  @calorieIntakes = CalorieIntake.find(params[:id])
end

def new
  @calorieIntakes = CalorieIntake.new
end

def create
  @calorieIntakes = CalorieIntake.new(blurb_params)
  @calorieIntakes.user = current_user
  if @calorieIntakes.save
    redirect_to blurb_path(@calorieIntakes)
  else
    redirect_to new_blurb_path
  end
end

def edit
end

def update
end

def destroy
end

private
def calorieIntakes_params
  params.require(:calorieIntakes).permit(:title, :body)
end
end
