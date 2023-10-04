require 'yaml'

menu_file_path = Rails.root.join('db', 'menu.yml')

if File.exist?(menu_file_path)
  begin
    data = YAML.load_file(menu_file_path)

    data['ingredients'].each do |ingredient|
      new_ingredient = Ingredient.new(name: ingredient)
      unless new_ingredient.save
        puts "Failed to save Ingredient '#{ingredient}': #{new_ingredient.errors.full_messages.join(', ')}"
      end
    end

    data['dishes'].each do |dish_data|
      dish = Dish.new(name: dish_data['name'])
      missing_ingredients = []
      dish_data['ingredients'].each do |ingredient_name|
        ingredient = Ingredient.find_by(name: ingredient_name)
        if ingredient
          dish.ingredients << ingredient
        else
          missing_ingredients << ingredient_name
        end
      end

      if missing_ingredients.empty?
        unless dish.save
          puts "Failed to save Dish '#{dish.name}': #{dish.errors.full_messages.join(', ')}"
        end
      else
        puts "Failed to save dish '#{dish.name}' is missing the following ingredients: #{missing_ingredients.join(', ')}." \
          " You should create it first."
      end
    end
  rescue StandardError => e
    puts "Error during seed data creation: #{e.message}"
  end
else
  puts "menu.yml file not found in #{menu_file_path}. Please make sure the file exists."
end
