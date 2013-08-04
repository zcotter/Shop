class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_categories
  before_filter :get_store

  def productListing
    @rowsPerPage = 6
    @productsPerRow = 3
    @productsPerPage = @rowsPerPage * @productsPerRow
  end

  def paginate(stuffToPaginate)
    return stuffToPaginate.page(params[:page]).per(@productsPerPage)
  end

  def get_categories
    @categories = Category.order("name")
  end

  def get_store
    @store = Store.first
    if !@store
      redirect_to new_store_path
    end
  end
end
