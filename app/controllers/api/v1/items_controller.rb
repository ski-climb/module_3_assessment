class API::V1::ItemsController < ActionController::API

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create

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
end
