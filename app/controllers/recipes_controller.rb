class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
		@ingredients = Ingredient.all
	end

	def edit
		@recipe = Recipe.find(params[:id])
		@ingredients = Ingredient.all
	end

	def create
		@recipe = Recipe.new(recipe_params)
		# @recipe.ingredients << Ingredient.find(params[:recipe][:ingredient_ids].present?)
		# binding.pry
		# params[:recipe][:ingredient_ids].each do |id|
		# 	@recipe.ingredients << Ingredient.find(id)
		# end
		if @recipe.save
			redirect_to @recipe
		else
			render :new
		end
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render :edit
		end
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :ingredient_ids => [])
	end
end
