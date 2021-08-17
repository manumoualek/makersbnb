feature 'Login page 'do 
  scenario 'Viewing login page ' do
    visit '/login'
    expect(page).to have_content "Login page"
  
  
  end   
end 