feature 'add tags' do
  scenario 'field exists to enter tag on new link' do
    visit '/links/new'
    expect(page).to have_field 'tag_name'
  end

  scenario 'links show tags that were added' do
    visit '/links/new'
    fill_in 'link_name', with: "Google"
    fill_in 'link_address', with: "http://google.com"
    fill_in 'tag_name', with: 'Search'
    expect(page).to have_content 'Search'
  end
end
