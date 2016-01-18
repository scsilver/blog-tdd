require 'rails_helper'

feature 'Using blog,' do
  feature 'user can create blog post.' do
    background do
      visit '/'
      click_link 'New Post', :match => :first

      fill_in 'Title', with: 'New Blog Post', :match => :first

      fill_in 'Content', with: '#Content foo bar', :match => :first

      click_button 'Create Post', :match => :first
    end

    scenario 'User can add post.' do
      expect(page).to have_content('New Blog Post')
    end

    scenario 'User can view post.' do
      visit '/'
      click_link 'New Blog Post', :match => :first
      expect(page).to have_content('New Blog Post')
      #expect(page).to have_content('#Content foo bar')
    end

    scenario 'User can view all posts titles.' do
      visit '/'
      click_link 'New Post' , :match => :first
      fill_in 'Title', with: 'Second', :match => :first

      fill_in 'Content', with: 'stuff', :match => :first

      click_button 'Create Post', :match => :first

      visit '/'

      expect(page).to have_content('New Blog Post')
      expect(page).to have_content('Second')
    end

  end

end
