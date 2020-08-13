class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
  end

  def create
    @dose = Dose.new(dose_params)

    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @dose.cocktail_id = @cocktail
    # @dose.ingredient_id = @ingredient

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
