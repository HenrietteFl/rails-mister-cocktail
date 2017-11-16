class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.ingredient = Ingredient.find(params[:ingredient_id])

    if @dose.save
      redirect_to @dose.cocktail
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete

    if @dose.save
      redirect_to @dose.cocktails
    else
      render :new
    end

  end

  private

  def dose_params
    params.require(:dose).permit(:description, :amount)
  end
end
