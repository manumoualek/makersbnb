feature 'Login page 'do 
  scenario 'Viewing login page ' do
    visit '/login'
    expect(page).to have_content "Login page"
  end   

  scenario 'User can add details to log in ' do 
    visit '/login'
    fill_in('username', with: "testlogin1")
    fill_in('password', with: "testpassword1")
    click_button('login')
  end

  scenario 'User can add the incorrect details to log in ' do 
    visit '/login'
    fill_in('username', with: "wronglogin")
    fill_in('password', with: "wrongpassword")
    click_button('login')
    expect(page).to have_content "Login page"
  end


  scenario 'checks if the data entered is a valid log in' do
    visit '/login'
    fill_in('username', with: "testlogin1")
    fill_in('password', with: "testpassword1")
    click_button('login')

    expect(page).to have_content "Book a space!"
  end 

end 