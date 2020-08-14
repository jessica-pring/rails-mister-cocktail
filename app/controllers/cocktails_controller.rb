class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
  end

  def create
    @cocktail = Cocktail.new(strong_params)

    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail was successfully created.'
    else
      render :new
    end
  end

  def update
    if @cocktail.update(strong_params)
      redirect_to @cocktail, notice: 'Cocktail was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktail_url, notice: 'Cocktail was successfully destroyed.'
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
  
  def strong_params
    params.require(:cocktail).permit(:name, :photo)
  end
  
end
