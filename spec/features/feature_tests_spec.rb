# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

feature '1. see a list of links on the homepage' do
  scenario 'list links' do
    visit '/'
    Link.create("www.google.com")
    expect(page).to have_link("wwww.google.com")
  end
end
