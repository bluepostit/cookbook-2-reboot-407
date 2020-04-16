require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class ScrapeBbcGoodFoodService
  RECIPE_URL_BASE = 'https://www.bbcgoodfood.com/search/recipes?query='

  def self.call(ingredient)
    url = RECIPE_URL_BASE + ingredient
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    results = []

    # Find all recipes on the page
    elements = doc.search('.node-recipe.node-teaser-item')
    elements.take(5).each do |element|
      name = element.search('.teaser-item__title').text.strip
      description = element.search('.field-item.even').text.strip
      prep_time = element.search('.teaser-item__info-item--total-time').text.strip

      recipe = Recipe.new(name: name, description: description, prep_time: prep_time)
      results << recipe
    end
    results
  end
end
