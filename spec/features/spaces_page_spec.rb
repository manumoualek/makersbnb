feature "spaces page" do
  scenario "user can visit the page with spaces" do
    visit('/spaces')
    expect(page).to have_content('Book a space!')
  end

  scenario "user can click on the 'list a space' button which takes them to the 
  spaces/new page" do
    visit('/spaces')
    click_link('List a space')
    expect(current_path).to eq('/spaces/new')
    expect(page).to have_content('List a space!')
  end

  scenario "user should see space(s) on the page" do
    connection = PG.connect(dbname: 'makersbnb_test')

    connection.exec(  #This creates a second entry into the user table so two different users can list a space.
      "INSERT INTO users (username, first_name, second_name, password, email)
      VALUES ('Gandalf', 'The', 
     'Grey', 'onering', 'todestroythemall@mordor.com');"
   )

    Space.create(
      space_name: 'Fanta house', 
      space_description: 'House that has a lot of fanta', 
      space_price: 95.00, 
      available_from: '2021-09-23', 
      available_to: '2021-04-12', 
      userID: '1'
    )

    Space.create(
      space_name: 'White house', 
      space_description: 'House that has a lot of white people', 
      space_price: 100000.00, 
      available_from: '2024-09-23', 
      available_to: '2030-04-12',
      userID: '2'
    )

    visit('/spaces')
    
    expect(page).to have_content("Fanta house")
    expect(page).to have_content("House that has a lot of fanta")
    expect(page).to have_content('95.00')
    expect(page).to have_content("2021-09-23")
    expect(page).to have_content("2021-04-12")

    expect(page).to have_content("White house")
    expect(page).to have_content("House that has a lot of white people")
    expect(page).to have_content("100000.00")
    expect(page).to have_content("2024-09-23")
    expect(page).to have_content("2030-04-12")

  end
end