require_relative 'view'

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
    @cookbook.add_recipe(Recipe.new(name, description))
  end

  def destroy
    # list the recipes
    # ask user for index
    # repository must delete recipe at that index
    list
    index = @view.ask_user_for_index
    @cookbook.remove_recipe(index)
  end

  def my_method

  end
end
