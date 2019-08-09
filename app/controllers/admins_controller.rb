class AdminsController < ApplicationController

  def show
    @countries = Country.all
    render :edit_products
  end

  def create
    name = params[:name]
    price = params[:price]
  end
end
