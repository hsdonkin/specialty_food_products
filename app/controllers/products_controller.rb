class ProductsController < ApplicationController

  def index
    @countries = Country.all
    @products = Product.all
    render :index
  end
end
