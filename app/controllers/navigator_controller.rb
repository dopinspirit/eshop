class NavigatorController < ApplicationController
  before_action :set_category, only: [:products_from_category]
  def index
    @categories = Category.all
    @products = Product.all
  end

  #retrieves a list of available category products
  def products_from_category
    @products = Product.where(:category_id => @category.id)
    logger.info @products
    respond_to do |format|
      format.js
    end

  end

  private

    def set_category
      @category = Category.find(params[:category_id])
    end

end
