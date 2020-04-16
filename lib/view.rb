class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      status = recipe.done? ? '[x]' : '[ ]'
      puts "#{index + 1}. #{status} #{recipe.name} (#{recipe.prep_time})"
    end
  end

  def ask_user_for(thing)
    puts "Please type the #{thing}"
    gets.chomp
  end

  def ask_user_for_index
    puts "Please type the number of the recipe"
    gets.chomp.to_i - 1
  end
end
