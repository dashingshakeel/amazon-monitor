class UsersController < ApplicationController
  

  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @group = @user.group
    @item = Item.new
    @items = Item.where(user_id: current_user.id)
    @items_monitor = Item.where(user_id: current_user.id, status: "monitor")
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
  def monitor
    @item = Item.find(params[:id])
    
    @group = current_user.group
    @groupitem = Groupitem.new(name: @item.name,url: @item.url,item_id: @item.id, group_id: @group.id)
    if @groupitem.save
      @item.status = "monitor"
      @item.save
      HttpJob.perform_later(@groupitem.url,@groupitem.id)
    end
    redirect_to current_user
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email,:password,:password_confirmation)
      
    end

   
end
