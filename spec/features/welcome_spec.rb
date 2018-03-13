require_relative '../spec_helper'

feature 'index page' do
  scenario 'when index page loads' do
    visit('/restaurants')
    expect(page).to have_content("FoodOnRails - hello!!")
  end
end
