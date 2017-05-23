class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render "index.html.erb"
  end

  def new 
    # @recipes = Recipe.find_by(id: params[:id])
    render "new.html.erb"
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render "show.html.erb"
  end

  def create 
    @recipe = Recipe.new(
      name: params[:form_name], 
      ingredients: params[:form_ingredients], 
      duration: params[:form_duration], 
      author: params[:form_auhtor],
      image: params[:form_image]
    )
    p @recipe
    @recipe.save
    flash[:success] = "Recipe successfully created!"
    redirect_to "/recipes/#{recipe.id}"
  end

  def edit 
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    render "edit.html.erb"
  end

  def update
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    @recipe.name = params[:form_name] 
    @recipe.ingredients= params[:form_ingredients] 
    @recipe.duration= params[:form_duration] 
    @recipe.author= params[:form_author]
    @recipe.image= params[:form_image]
    @recipe.save
    flash[:success] = "Recipe successfully updated!"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    @recipe.destroy
    flash[:success] = "Recipe successfully destroyed!"
    
    redirect_to "/recipes"
  end

end
