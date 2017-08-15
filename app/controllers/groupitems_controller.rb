class GroupitemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @groupitems = current_user.group.groupitems.all
  end
  def show
    
  end
  def destroy
    @groupitem.destroy
    redirect_to user_path(current_user.id), notice: 'Deleted ' 
  end
  private 
    def item_params
      params.require(:item).permit(:name, :url,:group_id, :item_id)
    end

    def set_item
      @groupitem = Groupitem.find(params[:id])
    end
end
