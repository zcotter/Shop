class PicturesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @picture = @product.pictures.create(params[:picture])
    redirect_to product_path(@product)
  end

  def index
    @product = Product.find(params[:product_id])
    @pictures = @product.pictures
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @picture = @product.pictures.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  def destroy
    @picture = Product.find(params[:product_id]).pictures.find(params[:id])
    @picture.destroy
    redirect_to product_pictures_path
  end
end
