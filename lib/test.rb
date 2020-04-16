require_relative 'cookbook'
require_relative 'controller'

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook = Cookbook.new(csv_file)
controller = Controller.new(cookbook)

controller.list
controller.create
