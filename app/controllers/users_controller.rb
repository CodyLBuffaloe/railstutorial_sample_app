class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #Activates byebug debugging console prompt,just start a console session. To exit byebug: Ctrl+D
    #debugger
  end

  def new
    @user = User.new
    #debugger
  end

  def create
    @user = User.new(user_params)  #Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to (@user)
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
