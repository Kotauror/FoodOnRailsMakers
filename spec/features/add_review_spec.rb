feature 'add a review' do
  scenario 'click on a restaurant name takes us to the restaurant page' do
    visit('/restaurants')
    click_on('DINO-GRILL')
    expect(page).to have_content("Dino Dinner was AMAZING")
  end

  scenario 'submitting a review will display it on the restaurant page' do
    visit('/restaurants')
    click_on('DINO-GRILL')
    fill_in('review[author]', :with => 'Laura')
    fill_in('review[text]', :with => 'I was served the worst falafel with the rudest service')
    select "2", :from => "review[score]"
    click_on('submit')
    expect(page).to have_content('I was served the worst falafel with the rudest service')
  end

  scenario 'submitting a review will display a flash message with thanks' do
    visit('/restaurants')
    click_on('DINO-GRILL')
    fill_in('review[author]', :with => 'Laura')
    fill_in('review[text]', :with => 'I was served the worst falafel with the rudest service')
    select "1", :from => "review[score]"
    click_on('submit')
    expect(page).to have_content('Thanks Laura, review has been saved')
  end

end
