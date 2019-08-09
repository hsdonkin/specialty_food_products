class ProductsController < ApplicationController

  def index
    @countries = Country.all
    @products = Product.all
    render :index
  end

  def show
    id = params[:id]
    @product = Product.find(id)
    country_id = @product.country_id
    @country = Country.find(country_id)
    @reviews = Review.where("product_id =#{id}")
    render :product
  end
end
