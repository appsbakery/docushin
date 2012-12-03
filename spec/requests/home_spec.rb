require File.expand_path(File.dirname(__FILE__) + '/requests_helper')

feature 'Visit Home of Docushin', 'I am so awesome I want to be able to go to my docushin home path' do
  scenario 'I click on the home page' do
    visit "/docushin"
    page.should have_content("Recent updates")
  end
end
