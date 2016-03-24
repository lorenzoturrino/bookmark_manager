feature 'user count & log in' do
  scenario 'page has form to log in' do
    visit '/'
    expect(page).to have_field 'username'
    expect(page).to have_field 'email'
    expect(page).to have_button 'sign in'
  end

  scenario 'counts number of current users' do
      sign_in
      expect(page).to have_content '1 user'
  end

  scenario 'email in database is correct' do
    sign_in
    expect(page).to have_content 'jazzy@email.com'
  end
end
