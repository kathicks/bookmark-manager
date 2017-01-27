def register
  visit '/sign_up'
  fill_in(:email, with: 'kat_hicks@gmail.com')
  fill_in(:password, with: '1234')
  click_button('Submit')
end
