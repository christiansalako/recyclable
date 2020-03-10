class FavoritesController < ApplicationController


def create
    @product = Product.find(params[:product_id])
    @favorite = Favorite.create(user: current_user, product: @product)
    redirect_to products_path
end

def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_back fallback_location: products_path(anchor: "favorite-#{@favorite.id}")
end

end
