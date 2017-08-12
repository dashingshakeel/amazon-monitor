class UsersController < ApplicationController
  

  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @group = @user.group
  end
  def create
    @user = User.new(user_params)
    if @user.save
      @group = Group.create!(user_id: @user.id, name: "Group")
      log_in @user
      flash[:success] = "Welcome to App"
      redirect_to @user
    else
      render 'new'
    end
    
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email,:password,:password_confirmation)
      
    end

   
end
