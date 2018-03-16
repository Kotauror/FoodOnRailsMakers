feature 'Sign up' do
  scenario 'Successful sign up' do
    visit('/')
    click_on('Sign up')
    fill_in('user[email]', :with => 'myamazingworld@hello.com')
    fill_in('user[password]', :with => 'password')
    click_on('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
