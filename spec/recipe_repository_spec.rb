require 'recipe_repository'

describe RecipeRepository do 

    def reset_recipes_table
      seed_sql = File.read('spec/seeds_recipes.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
      connection.exec(seed_sql)
    end

    def empty_recipes_table
      seed_sql = File.read('spec/seeds_empty.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
      connection.exec(seed_sql)
    end

    before(:each) do
      reset_recipes_table()
    end

    it"return a list of recipe"do     
      repo = RecipeRepository.new
      recipes = repo.all
      
      expected_result = Recipe.new("1", "Pancakes", '15', "5")
      expected_result_2 = Recipe.new("2", 'Meat pie', '45', "4")
      expected_result_3 = Recipe.new("3", 'Carbonara', '30', "5")
  
      expect(recipes).to eq [expected_result, expected_result_2, expected_result_3]  
    end

    it"return a list with the first recipe"do     
      repo = RecipeRepository.new
      recipes = repo.all
      
      expected_result = Recipe.new("1", "Pancakes", '15', "5")

      expect(recipes.first.name).to eq 'Pancakes'
      expect(recipes.first.average_time).to eq '15'
  end

  it "returns empty" do
    empty_recipes_table()

    repository = RecipeRepository.new
    recipes = repository.all
    expect(recipes).to eq []
  end

  it "return recipe by id" do
    repo = RecipeRepository.new
    recipes = repo.find(1)

    expect(recipes.name).to eq 'Pancakes'
  end

  it "raise error if id not found" do
    repo = RecipeRepository.new
    expect {repo.find(9)}.to raise_error("Recipe not found.")
  end
end