require File.expand_path(File.dirname(__FILE__) + '/requests_helper')

feature 'Visit Collections of Docushin', 'I am so awesome I want to be able to make some collections' do
  scenario 'I click on the collections page' do
    visit "/docushin/collections"
    page.should have_content("Create a new Collection")
  end
end
