feature 'confirm password' do
  scenario 'checks that user gets created' do
    visit '/'
    fill_in :username, with: 'Jazzy'
    fill_in :email, with: 'jazzy@email.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_button 'sign in'

    expect(page).to have_content 'Welcome Jazzy!'
  end

  scenario 'checks that users does not sign up with mismatching password' do
    visit '/'
    fill_in :username, with: 'Jazzy'
    fill_in :email, with: 'jazzy@email.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'not_password'
    click_button 'sign in'

    expect(page).to have_content 'mismatching password'
  end
end
