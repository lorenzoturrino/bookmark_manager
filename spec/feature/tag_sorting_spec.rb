feature 'filters links by tag' do

  before :each do
    visit '/links/new'
    fill_in 'link_name', with: 'goodtag_link'
    fill_in 'link_address', with: 'http://www.google.com'
    fill_in 'tag_name', with: 'search'
    click_button 'Memorize Bookmark'

    visit '/links/new'
    fill_in 'link_name', with: 'badtag_link'
    fill_in 'link_address', with: 'http://www.reddit.com'
    fill_in 'tag_name', with: 'mostlycats'
    click_button 'Memorize Bookmark'
  end

  scenario 'tag route should display associated links' do
    visit('/tags/search')
    expect(page).to have_link 'goodtag_link'
  end

  scenario 'tag route should not display links without the given tag' do
    visit('/tags/search')
    expect(page).not_to have_link 'badtag_link'
  end

end
