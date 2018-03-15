feature 'score' do
  scenario 'counts average score' do
    visit('/restaurants/new')
    fill_in('restaurant[name]', :with => 'Bad Bad')
    fill_in('restaurant[description]', :with => 'bad chicken strips')
    click_on('Create Restaurant')
    fill_in('review[author]', :with => 'Laura')
    fill_in('review[text]', :with => 'I was served the worst falafel')
    select "1", :from => "review[score]"
    click_on('submit')
    fill_in('review[author]', :with => 'Laura')
    fill_in('review[text]', :with => 'I was served the worst falafel')
    select "3", :from => "review[score]"
    click_on('submit')
    expect(page).to have_content('Average score: 2')
  end

  scenario 'restaurant has no review' do
    visit('/restaurants/new')
    fill_in('restaurant[name]', :with => 'No review restaurant')
    fill_in('restaurant[description]', :with => 'no chicken strips')
    click_on('Create Restaurant')
    expect(page).to have_content('Average score: 0.0')
  end
end
