# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager

feature 'add tags to link' do
  scenario 'a user would like to tag links in her bookmark manager' do
    visit '/links'
    click_button('Add Link')
    fill_in(:title, with: 'Facebook')
    fill_in(:url, with: 'www.facebook.com')
    fill_in(:tags, with: 'Social media')
    click_button('Save')
    link = Link.first
    expect(link.tags.map(&:name)).to include('Social media')
  end
end
