
feature '2. add a link' do
  scenario 'add the site address and title to my bookmark manager' do
    register
    
    visit '/links'
    click_button('Add Link')
    fill_in(:title, with: 'Facebook')
    fill_in(:url, with: 'www.facebook.com')
    fill_in(:tags, with: 'Social media')
    click_button('Save')
    expect(page).to have_text('Facebook')
    end
end
