feature 'Add multiple tags' do

  before :each do
    visit '/links/new'
    fill_in 'link_name', with: 'goodtag_link'
    fill_in 'link_address', with: 'http://www.google.com'
    fill_in 'tag_name', with: 'search advertising'
    click_button 'Memorize Bookmark'
  end

  scenario 'second tag should be stored with link' do
    expect(page).to have_content 'search'
    expect(page).to have_content 'advertising'
  end
end
