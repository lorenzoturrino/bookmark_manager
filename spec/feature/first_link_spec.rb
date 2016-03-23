feature 'links page' do

  scenario 'link page has a default link' do
    Link.create(link_address: "first_link", link_name: "this is the first link")
    visit '/links'
    expect(page).to have_link 'this is the first link'
  end

end
