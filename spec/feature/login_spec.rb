feature 'a user can sign up for the site and login' do

  before :each do
    visit '/'
  end

  feature 'login page' do

    scenario 'entry page is actually loading' do
      expect(page.status_code).to eq 200
    end

    feature 'register form' do

      scenario 'a field is present to insert a username' do
        expect(page).to have_field 'reg_username'
      end

      scenario 'a field is present to insert e-mail' do
        expect(page).to have_field 'reg_email'
      end

      scenario 'a field is present to insert a password' do
        expect(page).to have_field 'reg_pass'
      end

      scenario 'a button is present to send data' do
        expect(page).to have_button 'Sign Up'
      end

    end

    feature 'login form' do

      scenario 'a field is present to insert a username' do
        expect(page).to have_field 'log_username'
      end

      scenario 'a field is present to insert a password' do
        expect(page).to have_field 'log_pass'
      end

      scenario 'a button is present to send data' do
        expect(page).to have_button 'Log In'
      end

    end

  end

  feature 'registering a new user' do

    scenario 'a new user is successfully registered' do
      fill_in 'reg_username' , with: 'Test User'
      fill_in 'reg_email' , with: 'test@mail.com'
      fill_in 'reg_pass' , with: 'Test Pwd'
      click_button 'Sign Up'
      expect(page).to have_content 'Hello Test User'
    end

  end

  feature 'logging in an existing user' do

      scenario 'a existing user is successfully logged in' do
        fill_in 'log_username' , with: 'Test User'
        fill_in 'log_pass' , with: 'Test Pwd'
        click_button 'Log In'
        expect(page).to have_content 'Hello Test User'
      end

      scenario 'user count is displayed' do
        fill_in 'log_username' , with: 'Test User'
        fill_in 'log_pass' , with: 'Test Pwd'
        click_button 'Log In'
        expect(page).to have_content 'There are currently 1 registered users'
      end

  end

end
