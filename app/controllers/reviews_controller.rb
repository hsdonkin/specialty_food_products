class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create

    @product = Product.find(params[:product_id])
    content_body = params[:content_body]
    rating = params[:rating]
    review = current_user.reviews.new(:content_body => content_body, :rating => rating, :product_id => @product.id)
    if review.save
      flash[:notice] = {:message=>"Thanks! Your review for #{@product.name} has been added!", :class=>"alert alert-success"}
      redirect_to product_path(@product)
    else
      flash[:notice] = {:message=>review.errors.full_messages, :class=>"alert alert-danger"}
      redirect_to product_path(@product)
    end

  end

end
