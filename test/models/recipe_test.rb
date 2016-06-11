require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: 'wangrin', email: 'wangrinchef@chef.com')
    # @recipe = Recipe.new(name: 'afrique en danger', summary: 'good when reheat for breakfast', 
    #                       description: 'kourba kourba made with black sauce')
    @recipe = @chef.recipes.build(name: 'afrique en danger', summary: 'good when reheat for breakfast', 
                          description: 'kourba kourba made with black sauce')
  end
  
  test 'recipe should be valid' do
    assert @recipe.valid?
  end
  
  test 'chef_id should be present' do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test 'name should be present' do
    @recipe.name = ' '
    assert_not @recipe.valid?
  end
  
  test 'name length should not be too long' do
    @recipe.name = 'a' * 101
    assert_not @recipe.valid?
  end
  
  test 'name length should not be too shoort' do
    @recipe.name = 'aaaa'
    assert_not @recipe.valid?
  end
  
  test 'summary should be present' do
    @recipe.summary = ' '
    assert_not @recipe.valid?
  end
  
  test 'summary length should not be too loog' do
    @recipe.summary = 'a' * 151
    assert_not @recipe.valid?
  end
  
  test 'summary length should not be too short' do
    @recipe.summary = 'a' * 9
    assert_not @recipe.valid?
  end
  
  test 'description must be present' do
    @recipe.description = ' '
    assert_not @recipe.valid?
  end
  
  test 'description should not be too long' do 
    @recipe.description = 'a' * 501
    assert_not @recipe.valid?
  end
  
  test 'description should not be too short' do
    @recipe.description = 'a' * 9
    assert_not @recipe.valid?
  end
  
end