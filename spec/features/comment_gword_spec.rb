require 'rails_helper.rb'

feature "Comment a Gword entry" do
  scenario 'can create a comment' do

    When "I go to a GWordEntry's Definition 'Schule'" do
      page.visit 'gwords/1'
    end

    And "I fill in my name" do
      page.fill_in "commenter", with: 'NameTest'
    end

    And "I write my comment" do
      page.fill_in "body", with: 'TextTest'
    end

    And "I click create comment" do
      page.click_button "submit"
    end

    Then "I should see 'Comment was successfully created.'" do
      page.should have_content("Comment was successfully created.")
    end

  end
end
