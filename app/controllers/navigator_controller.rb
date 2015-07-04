class NavigatorController < ApplicationController
  before_action :set_category, only: [:products_from_category]
  before_action :set_product, only: [:product_details]

  def index
    @categories = Category.all
    @products = Product.all
  end

  #retrieves a list of available category products
  def products_from_category
    @products = Product.where(:category_id => @category.id)
    respond_to do |format|
      format.js
    end
  end

  #prepares product details partial
  def product_details
    respond_to do |format|
      format.js
    end
  end

  def product_review
    @review = Review.new(review_params)
    @product = Product.find_by_id(@review.product_id)
    @review.save
    respond_to do |format|
      format.js
    end
  end

  private

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_product
      @product = Product.find_by_id(params[:product_id])
    end

    def review_params
      params.require(:review).permit(:msg, :user_id, :product_id)
    end

end
