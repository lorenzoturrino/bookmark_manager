feature 'a user can sign up for the site and login' do

  feature 'login page' do

    before :each do
      visit '/'
    end

    scenario 'first page is actually loading' do
      visit '/'
      expect(page.status_code).to eq 200
    end

    scenario 'a field is present to insert a username' do
      expect(page).to have_field 'username'
    end

    scenario 'a field is present to insert e-mail' do
      expect(page).to have_field 'email'
    end

    scenario 'a button is present to send data' do
      expect(page).to have_button 'Sign Up'
    end

  end


  feature 'welcome page' do

    before :each do
      visit '/'
      fill_in 'username', with: 'Test User'
      fill_in 'email', with: 'Test@Email.com'
      click_button 'Sign Up'
    end

    scenario 'the user gets greeted by name ' do
      expect(page).to have_content 'Hello Test User'
    end

    xscenario 'user count increases by one' do

    end

  end

end
