feature 'add a restaurant' do
  scenario 'adding restaurant' do
    visit('/restaurants/new')
    fill_in('restaurant[name]', :with => 'KFC')
    fill_in('restaurant[description]', :with => 'amazing chicken strips')
    click_on('Create Restaurant')
    expect(page).to have_content("KFC")
  end

end
