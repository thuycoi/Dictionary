ENV['RAILS_ENV'] ||= 'test'
require 'rails_helper.rb'

feature "Searching in Gwords" do

  scenario "Searching for a word" do
    When "I go to Translantions page" do
      page.visit "/translations"
    end
    And "I search Haus" do
      page.fill_in "search", with: 'Haus'
    end
    And "I click search" do
      page.click_button "Suche"
    end
    Then "I should see Haus" do
      page.should have_content("Haus")
    end
  end
end
