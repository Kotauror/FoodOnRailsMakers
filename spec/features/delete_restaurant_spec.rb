feature 'delete a restaurant' do

  scenario 'deleting a restaurant removes it from the main page' do
    visit('/restaurants/new')
    fill_in('restaurant[name]', :with => 'Amazing Amazing')
    fill_in('restaurant[description]', :with => 'amazing chicken strips')
    click_on('Create Restaurant')
    click_on('Delete')
    expect(page).not_to have_content('Amazing Amazing')
  end

end
