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

  def destroy
    id = params[:id]
    @product = Product.find(id)
    @product.destroy
    @reviews = Review.where("product_id = #{id}")
    @reviews.destroy_all
    redirect_to admin_path
  end

  def update
    id = params[:id]
    update_name = params[:name]
    update_cost = params[:cost].delete!("$").to_f
    @product = Product.find(id)
    @product.name = update_name
    @product.cost = update_cost
    @product.save
    redirect_to admin_path
  end
end
