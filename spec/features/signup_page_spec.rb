require 'pg'

feature 'signup page' do
  scenario 'user can visit the signup page' do
    visit('/signup')
    expect(page).to have_content('Sign up to Makers BnB!')
  end

  scenario 'user can create an account which gets stored in the database' do
    visit('/signup')
    fill_in('username', with: 'Dillon')
    fill_in('first_name', with: 'Dylan')
    fill_in('second_name', with: 'Hancock')
    fill_in('password', with: 'jellySNAKES123')
    fill_in('email', with: 'Dillon@yahoo.co.uk')
    click_button('Submit')
 
    connection = PG.connect(dbname: 'makersbnb_test')
    result = connection.exec("SELECT * FROM users;").to_a

    expect(result[0]['username']).to eq('Dillon')
    expect(result[0]['first_name']).to eq('Dylan')
    expect(result[0]['second_name']).to eq('Hancock')
    expect(result[0]['password']).to eq('jellySNAKES123')
    expect(result[0]['email']).to eq('Dillon@yahoo.co.uk')
  end

  scenario "User gets message when trying to use a username thats already taken" do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO users 
        (username, first_name, second_name, password, email)
        VALUES ('Dillon', 'Dylan', 
        'Hancock', 'jellyBUBBLES123', 'dylan@gmail.com');"
      )

    visit('/signup')

    fill_in('username', with: 'Dillon')
    fill_in('first_name', with: 'Jack')
    fill_in('second_name', with: 'Hanma')
    fill_in('password', with: 'jellySNAKES123')
    fill_in('email', with: 'Dillon@brawlstarsdevteam.com')
    click_button('Submit')

    expect(page).to have_content('Username already exists, please try another.')
  end
end