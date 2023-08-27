class CartsController < ApplicationController
    include ApplicationHelper
    def perform
        @product = Product.find(params[:id])
    end

    def add
        @product = Product.find(params[:id])
        @product.update(params.require(:product).permit(:add_to_cart))
        if Cart.exists?(name: @product.name) && @product.available_quantity>=@product.add_to_cart
            @cart = Cart.find_by(name: @product.name)
            @cart.update(items: @cart.items+@product.add_to_cart, cost: @cart.cost+(@product.price * @product.add_to_cart))
            redirect_to products_path(@product), notice: "Product updated to cart"
        elsif !Cart.exists?(name: @product.name) && @product.quantity>=@product.add_to_cart
            @cart = current_user.carts.new(name: @product.name)
            @cart.items= @cart.items+@product.add_to_cart
            @cart.cost= @cart.cost+(@product.price * @product.add_to_cart)
            @product.carts << @cart
            redirect_to products_path(@product), notice: "Product added to cart"
        else
            redirect_to products_path(@product), notice: "Selected more quantity"
        end
    end

    def show
        @carts = Cart.where(user_id: current_user)
        @carts = sorting_table(@carts) if params[:sort].present?
    end

    def remove
        @cart = Cart.find(params[:id])
        @cart.update(params.require(:cart).permit(:remove_item))
        if @cart.remove_item>0 && @cart.remove_item<=@cart.items
            @cart.update(items: @cart.items - @cart.remove_item, cost: @cart.cost - (@cart.product.price * @cart.remove_item))
            redirect_to cart_path(current_user), notice: "Product removed from cart"
        else
            redirect_to cart_path(current_user), notice: "Selected more quantity"
        end
    end

    def checkout
        @carts = Cart.where(user_id: current_user)
        @carts.each do |cart|
            cart.product.update(quantity: cart.product.quantity - cart.items)
        end
        @carts.destroy_all
        redirect_to root_path, notice: "Product purchased successfully"
    end
end
