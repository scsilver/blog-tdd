require 'rails_helper'

feature 'Using blog,' do
  feature 'user can create blog post.' do
    background do
      visit '/'
      click_link 'New Post'
      fill_in 'Title', with: 'New Blog Post'

      fill_in 'Content', with: '#Content foo bar'

      click_button 'Create Post'
    end

    scenario 'User can add post.' do
      expect(page).to have_content('New Blog Post')
    end

    scenario 'User can view post.' do
      visit '/'
      expect(page).to have_content('New Blog Post')
      expect(page).to have_content('#Content foo bar')
    end

    scenario 'User can view all posts titles.' do
      visit '/'
      click_link 'New Post'
      fill_in 'Title', with: 'Second'

      fill_in 'Content', with: 'stuff'

      click_button 'Create Post'

      visit '/'

      expect(page).to have_content('New Blog Post')
      expect(page).to have_content('Second')
    end

  end

end
