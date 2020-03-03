class ProductsController < ApplicationController
    def show

      @product = Product.find(params[:id])
      @material = @product.material

    end

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @user = current_user
      @product = Product.new(product_params)
      @material = Material.new(material_params)
      @product.user = @user
        if @product.save
          @material.product = @product
          @material.save
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

    private

    def material_params
      params.require(:product).require(:material).permit(:category, :recyclability)
    end

    def product_params
      params.require(:product).permit(:name, :category, :photo)
    end
end
