class ProductsController < ApplicationController
    def show

      @product = Product.find(params[:id])
      @materials = @product.materials

    end

    def index
      # @products = Product.all

      if params[:query].present?
        @products = Product.where("name ILIKE ?", "%#{params[:query]}%").includes(:favorites)
      else
        @products = Product.all.includes(:favorites)
      end
      @products = Product.where(user: current_user).includes(:favorites) if current_user.producer
    end

    def new
      @product = Product.new
    end

    def create
      @user = current_user
      @product = Product.new(product_params)
      @product.user = @user
      if @product.save
        redirect_to user_path(current_user)
      else
        render :new
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      @product.update(product_params)
      if @product.save
        redirect_to user_path(current_user)
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to user_path(current_user)
    end

    def alternatives
      @product = Product.find(params[:id])
      results = Product.where(category: @product.category).joins(:materials).merge(Material.where(recyclability: true))
      @alternatives = results.select { |alternative| alternative.fully_recyclability == 100 }
    end

    def game
      @products = Product.all.sample(15)


    end

    def product_params
      params.require(:product).permit(:name, :category, :photo, material_ids: [])
    end
end
