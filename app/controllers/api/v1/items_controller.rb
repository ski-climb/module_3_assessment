class API::V1::ItemsController < ApplicationController
  include ApplicationController::API

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    if item
      item.destroy
      render nothing: true, status: 204
    else
      render nothing: true, status: 404
    end
  end
end
