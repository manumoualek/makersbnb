feature "List a space page" do
  scenario "User can visit the page" do
    visit('/spaces/new')
    expect(page).to have_content('List a space!')
  end

  scenario "User creates a space row in database and gets redirected to page with
  spaces, should see their own space that they just made" do
    visit('/spaces/new')
    fill_in('listing_name', with: 'Valley of the end')
    fill_in('listing_description', with: 'Very big valley with lots of end yes')
    fill_in('listing_price_per_night', with: '95.00')
    fill_in('listing_available_from', with: '2021/05/05')
    fill_in('listing_available_to', with: '2021/05/06')
    click_button('List my space')
 
    connection = PG.connect(dbname: 'makersbnb_test')
    result = connection.exec("SELECT * FROM spaces;").to_a

    expect(result[0]['space_name']).to eq('Valley of the end')
    expect(result[0]['space_description']).to eq('Very big valley with lots of end yes')
    expect(result[0]['space_price']).to eq('95.00')
    expect(result[0]['available_from']).to eq('2021-05-05')
    expect(result[0]['available_to']).to eq('2021-05-06')

    expect(current_path).to eq('/spaces')
    expect(page).to have_content('Valley of the end')
    expect(page).to have_content('Very big valley with lots of end yes')
    expect(page).to have_content('95.00')
    expect(page).to have_content('2021-05-05')
    expect(page).to have_content('2021-05-06')
  end


end