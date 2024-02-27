class ItemsController < ApplicationController

  def upload
    @item = Item.new(item_params)
    @item.save!
    # 以下省略(リダイレクトしたりエラー時の処理なんかを書く)
  end

  private

    def item_params
      params.require(:item).permit(
        :image
        :image_x,
        :image_y,
        :image_w,
        :image_h,
      )
    end

end 