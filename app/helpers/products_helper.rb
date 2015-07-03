module ProductsHelper

  def category_name(product)

    Category.find_by_id(product.category_id).name

  end

end
