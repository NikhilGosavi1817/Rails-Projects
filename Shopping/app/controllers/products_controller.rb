class ProductsController < ApplicationController
    include ApplicationHelper
    def index
        @products = Product.all
        sort_products(@products) if params[:sort].present?
    end

    def sort_products(products)
        case params[:sort]
        when "available_quantity"
          @products=@products.sort_by { |products| products.available_quantity}
          @products=@products.reverse if params[:direction] == 'desc'
        else
          @products = sorting_table(products)
        end
      end
end
