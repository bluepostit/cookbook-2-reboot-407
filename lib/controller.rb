require_relative 'view'
require_relative 'scrape_bbc_good_food_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end


  def list
    # get recipes from repo
    recipes = @cookbook.all
    # show it using the view
    @view.display(recipes)
  end

  def create
    # ask user for name - get from view
    # ask user for description - get from view
    # create new Recipe object with name & description
    # add it to the repository/cookbook
    name = @view.ask_user_for('name')
    description = @view.ask_user_for('description')
    prep_time = @view.ask_user_for('prep_time')
    recipe = Recipe.new(name: name, description: description, prep_time: prep_time)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # list the recipes
    # ask user for index
    # repository must delete recipe at that index
    list
    index = @view.ask_user_for_index
    @cookbook.remove_recipe(index)
  end

  def import
    # Ask user for keyword
    # Create URL with user's keyword
    # Download page for the URL
    # Parse the first 5 results from the page
    # Create an array called 'results', holding these 5 recipes
    # Display the 'results' recipes
    # Ask user to choose a recipe to import
    # Get recipe matching the user's input
    # Add it to the cookbook
    # (Display all recipes)
    keyword = @view.ask_user_for('ingredient to search for')

    results = ScrapeBbcGoodFoodService.call(keyword)
    @view.display(results)
    index = @view.ask_user_for_index
    @cookbook.add_recipe(results[index])
  end

  def mark_as_done
    # display recipes
    # ask user for index
    # find the recipe (cookbook)
    # mark it as done
    # save to csv
    # display recipes
    list
    index = @view.ask_user_for_index
    @cookbook.mark_as_done(index)
    list
  end
end
