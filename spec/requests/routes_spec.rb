require File.expand_path(File.dirname(__FILE__) + '/requests_helper')

feature 'Visit Routes of Docushin', 'Visiting #mount_path/routes should display/group all my routes' do
  scenario 'I visit the routes path' do
    visit "/docushin/routes"
    binding.pry
  end
end
