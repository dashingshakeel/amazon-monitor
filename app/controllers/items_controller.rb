class ItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def create
      @item = current_user.items.build(item_params)
      respond_to do |format|
        if @item.save
           @user = @item.user_id
          format.html {redirect_to user_path(current_user.id), notice: 'Created '}
        end
      end
   
  end
  def destroy
    @item.destroy
    redirect_to user_path(current_user.id), notice: 'Deleted ' 
  end
  private 
    def item_params
      params.require(:item).permit(:name, :url,:user_id)
    end
    def set_item
      @item = Item.find(params[:id])
    end
end
