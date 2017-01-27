feature 'having a sign up page' do
  scenario 'user selects sign up and is directed to a sign up page' do
    visit '/'
    click_link ('Sign Up')
    within 'form#signup' do
      expect(page).to have_content('Enter your email')
    end
  end

  scenario 'user can enter an email and password, and submits the form' do

    visit '/sign_up'
    fill_in(:email, with: 'hello@mail.com')
    fill_in(:password, with: '1234')
    fill_in(:confirm_password, with: '1234')
    click_button('Submit')

    expect(current_path).to eq '/links'
    expect(page).to have_content('Welcome, hello@mail.com!')
    expect{register}.to change(User, :count).by(1)
  end
end
