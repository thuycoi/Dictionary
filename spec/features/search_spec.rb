feature "Searching in Gwords" do

  Steps "Result found" do
    When "I go to Translantions page" do
      page.visit "/translations"
    end
    And "I search something" do
      page.fill_in "Search", :with 'Schule'
    end
    And "I click login" do
      page.click_button "Suche"
    end
    Then "I should see Schule" do
      page.should have_content("Schule")
    end
  end
