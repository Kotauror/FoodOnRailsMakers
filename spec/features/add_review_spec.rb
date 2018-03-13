feature 'add a review' do
  scenario 'click on restaurants name takes us to restaurants page' do
    visit('/restaurants')
    click_link('DINO-GRILL')
    expect(page).to have_content("Dino Dinner was AMAZING")
  end
end
