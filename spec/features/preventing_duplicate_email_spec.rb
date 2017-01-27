feature 'duplicate email validation' do
  scenario 'user cannot sign in more than once' do
    visit '/sign_up'
    fill_in(:email, with: 'hello@gmail.com')
    fill_in(:password, with: '1234')
    fill_in(:confirm_password, with: '1234')
    click_button('Submit')

    visit '/sign_up'
    fill_in(:email, with: 'hello@gmail.com')
    fill_in(:password, with: '1234')
    fill_in(:confirm_password, with: '1234')
    click_button('Submit')
    expect(page).to have_content "This email is already in use"

  end
end
