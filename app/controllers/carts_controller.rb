class CartsController < ApplicationController
    before_action :set_cart, only: [:show, :update, :destroy]
    before_action :get_total, only: [:index, :all, :show]

  
    # GET /carts
    def index
        if params[:query].present?
            @products = Product.where("name LIKE ?", "%#{params[:query]}%")
        else
            @products = Product.all
        end
    end

    def all
        @carts = Cart.includes(:product).all
        @total_price = 0
        @total_quantity = 0
      
        @carts.each do |cart|
          @total_price += cart.product.price * cart.quantity
          @total_quantity += cart.quantity
        end
    end
      
  
    # GET /carts/1
    def show
    end
  
    # POST /carts
    def create
        @cart = Cart.new(product_id: params[:product_id], quantity: params[:quantity])
      
        if @cart.save
          redirect_to @cart, notice: 'Cart was successfully created.'
        else
          render :new
        end
    end
      
      
  
    # PATCH/PUT /carts/1
    def update
     
    end
  
    # DELETE /carts/1
    def destroy
      @cart.destroy
      redirect_to carts_all_path, notice: 'Cart was successfully destroyed.'
    end

    
  
    private
      def set_cart
        @cart = Cart.find(params[:id])
      end
  
      def cart_params
        params.permit(:product_id, :quantity)
      end

      def get_total
        @total_count=Cart.count
      end
      
      
      
  end
  