class AdminsController < ApplicationController

  def show
    @countries = Country.all
    render :edit_products
  end

  def create
    # this has to be here for the refresh
    @countries = Country.all

    name = params[:name]
    price = params[:price]
    country_id = params["Country of Origin"].to_i
    product = Product.new(:name => name, :cost => price, :country_id => country_id)
    # used to have a create! here buuuut it would bug out the entire app if it failed validation
    #so now we check if it's valid separately, then save it
    if product.valid?
      product.save
      flash[:notice] = {:message => "#{name} added successfully!", :class => "alert alert-success"}
      redirect_to :controller => 'admins', :action => 'show'
    else
      flash[:bad] = {:message => "Whoops! Try again!", :class => "alert alert-danger"}
      redirect_to :controller => 'admins', :action => 'show'
    end

  end
end
