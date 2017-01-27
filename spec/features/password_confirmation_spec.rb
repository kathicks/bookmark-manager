feature 'having password confirmation' do
  scenario 'user has to confirm password for account to be created' do
    def register_error
      visit '/sign_up'
      fill_in(:email, with: 'kat_hicks@gmail.com')
      fill_in(:password, with: '1234')
      fill_in(:confirm_password, with: '4321')
      click_button('Submit')
    end

    register_error

    expect{register_error}.not_to change(User, :count)
  end
end
