class ProductsController < ApplicationController
    def show

      @product = Product.find(params[:id])
      @materials = @product.materials

    end

    def index
      @products = Product.all
        if params[:query].present?
          @products = Product.where("name ILIKE ?", "%#{params[:query]}%")
        else
          @products = Product.all
      end
    end

    def new
      @product = Product.new
    end

    def create
      @user = current_user
      @product = Product.new(product_params)
      @product.user = @user
      if @product.save
        redirect_to product_path(@product)
      else
        render :new
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      @product.update(params[:product])
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_path
    end

    def product_params
      params.require(:product).permit(:name, :category, :photo, material_ids: [])
    end
end
