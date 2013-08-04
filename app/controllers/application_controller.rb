class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_categories
  before_filter :get_store
  before_filter :get_settings

  def productListing
    @rowsPerPage = @settings.rows_per_page
    @productsPerRow = @settings.products_per_row
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

  def get_settings
    @settings = Setting.first
    if !@settings
      redirect_to new_setting_path
    end
  end
end
