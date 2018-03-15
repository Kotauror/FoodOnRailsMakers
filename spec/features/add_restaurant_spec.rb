feature 'add a restaurant' do
  scenario 'adding restaurant' do
    visit('/restaurants/new')
    fill_in('restaurant[name]', :with => 'KFC')
    fill_in('restaurant[description]', :with => 'amazing chicken strips')
    click_on('Create Restaurant')
    expect(page).to have_content("KFC")
  end

  scenario 'adding restaurant without a name is invalid' do
    visit('/restaurants/new')
    fill_in('restaurant[description]', :with => 'amazing chicken strips')
    click_on('Create Restaurant')
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'adding restaurant without a description is invalid' do
    visit('/restaurants/new')
    fill_in('restaurant[name]', :with => 'KFC')
    click_on('Create Restaurant')
    expect(page).to have_content("Description can't be blank")
  end

end
