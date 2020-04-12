class StepsController < ApplicationController
  before_action :set_recipe, only: [:new, :show, :create]

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.recipe = @recipe

    # if came_from_update_page? # when updating ingredient
      # @dose.save
      # redirect_to edit_cocktail_path(@cocktail)
    # else # will redirect to cocktail dose create page
      if @step.save
        redirect_to new_recipe_step_path(@recipe)
      else
        render :new
      end
    # end
  end

  private

  def step_params
    params.require(:step).permit(:description)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
