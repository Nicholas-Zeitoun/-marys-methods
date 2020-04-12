class IngredientsController < ApplicationController
  before_action :set_recipe, only: [:new, :show, :create]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.recipe = @recipe

    # if came_from_update_page? # when updating ingredient
      # @dose.save
      # redirect_to edit_cocktail_path(@cocktail)
    # else # will redirect to cocktail dose create page
      if @ingredient.save
        redirect_to new_recipe_ingredient_path(@recipe)
      else
        render :new
      end
    # end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:description)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
