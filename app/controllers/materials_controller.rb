class MaterialsController < ApplicationController
    def new
        @product = Product.find(params[:product_id])
        @material = Material.new
    end

    def create
        @product = Product.find(params[:product_id])
        @material = Material.new(material_params)
        @material.product = @product
        if @material.save
        redirect_to product_path(@product)
        else 
            render :new
        end
    end

    private
    def material_params
        params.require(:material).permit(:category, :recyclability)
    end
end
