feature "can get values of the space the user has chosen" do
  scenario "user sees space availability of space they chose via the 'book' button" do
    connection = PG.connect(dbname: 'makersbnb_test')

    connection.exec("INSERT INTO spaces (spaceid, available_from, available_to, userid) 
       VALUES ('1', '2021-12-01', '2021-12-23', '1');")

    connection.exec("INSERT INTO spaces (spaceid, available_from, available_to, userid) 
       VALUES ('2', '2021-12-01', '2021-12-23', '1');")

    connection.exec("INSERT INTO spaces (spaceid, available_from, available_to, userid) 
       VALUES ('3', '2021-01-12', '2021-01-25', '1');")

    visit('/spaces')
    find('#2').click
    expect(current_path).to eq('/booking')
    expect(page).to have_content("min = 2021-12-01")
    expect(page).to have_content("max = 2021-12-23")
  end
  
  scenario "user can select a date and book the space" do
    
  end
end