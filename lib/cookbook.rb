require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    # init an empty array for recipe objects
    # load recipes from csv
    @csv_file_path = csv_file_path
    @recipes = []
    load_from_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    # save to csv
    save_to_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    # save to csv
    save_to_csv
  end

  private

  def load_from_csv
    # open csv
    # iterate over lines
    # for each line:
    # create a new Recipe
    # add it to the array
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_to_csv
    csv_options = { force_quotes: true }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
