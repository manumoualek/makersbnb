feature 'homepage' do
  scenario 'user can visit the homepage' do
    visit('/')
    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome to makersbnb!')
  end

  scenario "user can visit signup page if they click on the signup button" do
    visit('/')
    click_link('Sign up!')
    expect(current_path).to eq('/signup')
    expect(page).to have_content('Sign up to Makers BnB!')
  end

  scenario "user can visit signup page if they click on the signup button" do
    visit('/')
    click_link('Log in!')
    expect(current_path).to eq('/login')
    expect(page).to have_content('Login page')
  end
end