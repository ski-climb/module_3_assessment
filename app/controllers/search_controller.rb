class SearchController < ApplicationController

  def index
    @stores = Store.stores_by_zipcode(params[:search])
  end
end

