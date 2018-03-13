require_relative '../spec_helper'

feature 'index page' do
  scenario 'when index page loads' do
    visit('/restaurants')
    expect(page).to have_content("Food on Rails - a Rails application for Food")
  end
end
