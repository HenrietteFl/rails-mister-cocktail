class DosesController < ApplicationController
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def dose_params
    params.require(:dose).permit(:description, :amount, :ingredient_id)
  end
end
