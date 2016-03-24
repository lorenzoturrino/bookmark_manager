feature 'user count & log in' do
  scenario 'page has form to log in' do
    visit '/'
    expect(page).to have_field 'username'
    expect(page).to have_field 'email'
    expect(page).to have_button 'sign in'
  end
  #
  # scenario 'user count goes up by one when user signs up' do
  #
  # end
end
