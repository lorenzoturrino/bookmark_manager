def sign_in
  visit '/'
  fill_in :username, with: 'Jazzy'
  fill_in :email, with: 'jazzy@email.com'
  fill_in :password, with: 'password'
  fill_in :password_confirmation, with: 'password'
  click_button 'sign in'
end
