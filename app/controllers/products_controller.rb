class ProductsController < ApplicationController

    before_action :set_product, only: [:destroy, :show, :edit, :update]
    before_action :get_total, only: [:index]

    def index
        @products = Product.all
    end

    def destroy
        @product.destroy
        redirect_to products_path
    end
    
    def show
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.new(product_params)
    
        if @product.save
            redirect_to products_path
        else
            redirect_to products_path
        end
    end

    def edit
        @products = Product.all
        render :index
    end

    def update
        if @product.update(product_edit_params)
            redirect_to products_path, notice: 'Product was successfully updated.'
        else
            redirect_to products_path
        end
    end

    private

    def set_product
        @product = Product.find(params[:id])
    end

    def product_params
        params.permit(:name, :description, :price)
    end
    def product_edit_params
        params.require(:product).permit(:name, :description, :price)
    end

    def get_total
        @total_count=Cart.count
    end
end
