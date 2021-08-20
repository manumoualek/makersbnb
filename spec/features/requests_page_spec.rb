
feature 'request page ' do 
  scenario 'Check the home page exists' do 
    visit '/requests'
    expect(page).to have_content "Requests"
  end 

  scenario "A section showing the requests that I have made" do 
    visit '/requests'
    expect(page).to have_content "Requests I've made:"
  end 

  scenario "A section for showing requests for my space" do 
    visit '/requests'
    expect(page).to have_content "Requests for my space"
  end 

  scenario "" do 
    visit '/requests'
  end 

  scenario "" do 
    visit '/requests'
  end 

  scenario "" do 
    visit '/requests'
  end 

end 