feature 'Sign up' do
  scenario 'Successful sign up' do
    visit('/')
    click_on('Register')
    fill_in('user[email]', :with => 'myamazingworld@helloaa.com')
    fill_in('user[password]', :with => 'password')
    fill_in('user[password_confirmation]', :with => 'password')
    click_on('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
