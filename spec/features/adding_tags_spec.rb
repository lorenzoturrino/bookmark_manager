feature 'add tags' do
  xscenario 'view tags added' do
    visit '/links/new'
    fill_in :title, with: 'Makers Academy'
    fill_in :url, with: 'http://www.makersacademy.com'
    fill_in :name, with: 'education'
    click_button 'Submit'

    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
    end

    xscenario 'can add mutiple tags' do
      visit '/links/new'
      fill_in :title, with: 'Makers Academy'
      fill_in :url, with: 'http://www.makersacademy.com'
      fill_in :name, with: 'education, makers, fun, boob'
      click_button 'Submit'

      visit '/links/new'
      fill_in :title, with: 'Not Makers Academy'
      fill_in :url, with: 'http://www.notmakersacademy.com'
      fill_in :name, with: 'education, makers, boob'
      click_button 'Submit'

      visit '/tags/fun'
      within 'ul#links' do
        expect(page).to have_content('Makers Academy')
        expect(page).to_not have_content('Not Makers Academy')
      end
    end

  end
