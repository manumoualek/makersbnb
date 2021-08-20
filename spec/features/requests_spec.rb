
feature 'request page ' do 
  scenario 'Check the home page exists' do 
    visit '/requests'
    expect(page).to have_content "Requests"
  end 

  scenario "A section showing the requests that I have made" do 
    visit '/requests'
    expect(page).to have_content "Requests I've made:"
  end 

end 