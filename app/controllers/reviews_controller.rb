class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:create]

  def create

    @product = Product.find(params[:product_id])
    content_body = params[:content_body]
    rating = params[:rating]
    current_user.reviews.create!(:content_body => content_body, :rating => rating, :product_id => @product.id)
    redirect_to product_path(@product)
  end

end
