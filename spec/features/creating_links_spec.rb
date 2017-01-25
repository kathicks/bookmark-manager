feature 'add a link' do
  scenario 'add the site address and title to my bookmark manager' do
    visit '/links'
    click_button('Add Link')
    fill_in(:title, with: 'Facebook')
    fill_in(:url, with: 'www.facebook.com')
    click_button('Save')
    expect(page).to have_text('Facebook')
  end
end
