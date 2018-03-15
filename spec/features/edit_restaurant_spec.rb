feature 'edit a restaurant' do

  scenario 'editing a restaurant changes the content of that restaurants page' do
    visit('/restaurants/new')
    fill_in('restaurant[name]', :with => 'Bad Bad')
    fill_in('restaurant[description]', :with => 'bad chicken strips')
    click_on('Create Restaurant')
    click_on('Edit')
    fill_in('restaurant[description]', :with => 'good chicken strips')
    click_on('Update Restaurant')
    expect(page).not_to have_content('bad chicken strips')
  end

end
