class CategoriesController < ApplicationController
  def create
    @category = Category.new(params[:category])
    @category.save
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.find_all_by_category_id(params[:id])
    productListing()
    @products = Product.order("name").where("category_id = '#{@category.id}'")
    @products.each do |product|
      puts product.category_id
    end
    @products = paginate(@products)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end
end
