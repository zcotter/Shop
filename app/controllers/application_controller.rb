class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_categories

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
end
