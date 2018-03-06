class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
  	@user=User.new
  end

  def create
  	@user=User.new(user_params)
  	if @user.save
  		flash[:success]="Welcome to our app"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  private
   def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
   end
end