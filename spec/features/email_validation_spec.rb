feature 'email validation' do
  scenario 'user cannot sign in without entering an email' do
    visit '/sign_up'
    fill_in(:email, with: '')
    fill_in(:password, with: '1234')
    fill_in(:confirm_password, with: '1234')
    click_button('Submit')

    expect(page).to have_content 'No email entered'
  end

  scenario 'user cannot sign in with an invalid email' do
    visit '/sign_up'
    fill_in(:email, with: 'invalid@email')
    fill_in(:password, with: '1234')
    fill_in(:confirm_password, with: '1234')
    click_button('Submit')

    expect(page).to have_content 'Invalid email entered'
  end
end
