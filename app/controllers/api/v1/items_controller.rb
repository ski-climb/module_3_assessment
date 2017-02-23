class API::V1::ItemsController < ActionController::API

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item, status: 201
    else
      render nothing: true, status: 422
    end
  end

  def destroy
    begin
      item = Item.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    end

    if item
      item.destroy
      render nothing: true, status: 204
    else
      render nothing: true, status: 404
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end
