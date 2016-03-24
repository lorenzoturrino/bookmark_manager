def sign_in
  visit '/'
  fill_in :username, with: 'Jazzy'
  fill_in :email, with: 'jazzy@email.com'
  click_button 'sign in'
end
