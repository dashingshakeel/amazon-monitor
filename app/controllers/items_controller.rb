class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def create
    @item = current_user.items.build(item_params)
    @item.status = "not"
    if @item.save

      redirect_to user_path(current_user.id), notice: 'Created '
    else
      redirect_to user_path(current_user.id), notice: 'Couldnot create'
    end
  end

  def show
    @item = Item.find(params[:id])
  end
  def destroy
    @item.destroy
    redirect_to user_path(current_user.id), notice: 'Deleted ' 
  end
  private 
    def item_params
      params.require(:item).permit(:name, :url,:user_id, status: "not")
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
