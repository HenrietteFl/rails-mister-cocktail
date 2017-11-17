class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id] || params[:id])
  end
end
