class CalorieIntakesController < ApplicationController
before_action :authorize

def index
  @calorieIntakes = CalorieIntakes.all
end

def show
  @calorieIntakes = CalorieIntakes.find(params[:id])
end

def new
  @calorieIntakes = CalorieIntakes.new
end

def create
  @calorieIntakes = CalorieIntakes.new(blurb_params)
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
def blurb_params
  params.require(:blurb).permit(:title, :body)
end
end
