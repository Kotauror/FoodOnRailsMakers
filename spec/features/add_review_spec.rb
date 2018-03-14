feature 'add a review' do
  scenario 'click on a restaurant name takes us to the restaurant page' do
    visit('/restaurants')
    click_on('DINO-GRILL')
    expect(page).to have_content("Dino Dinner was AMAZING")
  end

  scenario 'submitting a review will display it on the restaurant page' do
    visit('/restaurants')
    click_on('DINO-GRILL')
    fill_in('author').with('Laura')
    fill_in('text').with('I was served the worst falafel with the rudest service')
    fill_in('score').with(1)
    click_on('submit')
    expect(page).to have_content('I was served the worst falafel with the rudest service')
  end

# Add test for invalid form

end
