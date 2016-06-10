class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    # BMR = 655 + ( 4.35 x weight in pounds ) + ( 4.7 x height in inches ) - ( 4.7 x age in years )
    @bmr = bmr(@user.gender, @user.weight, @user.height, @user.age)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email = @user.email.downcase
    if @user.save
      redirect_to new_session_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private
def user_params
  params.require(:user).permit(:name, :email, :age, :password_digest, :weight, :height, :gender)
end
