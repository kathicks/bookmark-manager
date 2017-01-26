# As a time-pressed user
# So that I can organise my links into different categories for ease of search
# I would like to add tags to the links in my bookmark manager

feature 'add multiple tags' do
  scenario 'a user would like to add multiple tags to the links in their bookmark manager' do
    visit '/links'
    click_button('Add Link')
    fill_in(:title, with: 'Facebook')
    fill_in(:url, with: 'www.facebook.com')
    fill_in(:tags, with: 'Social media, Bubbles')
    click_button('Save')
    expect(page).to have_content("Tag: Social media; Bubbles")
  end
end
