# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

  feature '1. see a list of links on the homepage' do
    scenario 'list links' do
        Link.create(title: "google", url: "www.google.com")
        visit '/links'
        within('ul#links') do
          expect(page).to have_content("google")
        end
    end
  end
