
require 'rails_helper.rb'

feature 'Creating Comment' do
  scenario 'can create a comment' do
    visit '/Gwords/1'
    click_link 'Kommentar hinzufügen'
    fill_in 'commenter', with: 'Name'
    fill_in 'body', with: 'Kommentar'
    click_button 'Create Comment'
    expect(page).to have_content('Comment was successfully created.')
  end
end
