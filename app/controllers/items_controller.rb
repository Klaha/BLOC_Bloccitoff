class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = @user.items.build(item_params)
    @new_item = Item.new

    if @item.save
      # flash[:notice] = "Item created"
    else
      # flash[:error] = "There was a problem saving your Item. Try again!"
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
