require 'rails_helper'

feature 'User can create articles' do
    before do
      visit root_path
      click_on "New Article"
    end
  
  context "Successfully create an article [Happy Path]" do
    before do
      fill_in "article_title", with: "Happy holidays"
      fill_in "article_content", with: "Buy your gifts now!"
      click_on "Save Article"
    end
  
    it 'User should be on article show page' do
      article = Article.find_by(title: 'Happy holidays')
      expect(current_path).to eq article_path(article)
    end
  
    it 'User should see success message' do
      expect(page).to have_content 'Article created'
    end
  
    it 'User should see article title' do
      expect(page).to have_content 'Happy holidays'
    end
  
    it 'User should see article content' do
      expect(page).to have_content 'Buy your gifts now!'
    end
  end
  
  context "User doesn't enter a title for the article [Sad Path]" do
    before do
      fill_in "Content", with: "Buy your gifts now!"
      click_on "Save"
    end
  
    it 'User should see error message' do
      expect(page).to have_content "Title can't be blank"
    end
  end

  context "User doesn't enter a content for the article [Sad Path]" do
    before do
      fill_in "Title", with: "Happy holidays"
      click_on "Save"
    end
  
    it 'User should see error message' do
      expect(page).to have_content "Content can't be blank"
    end
  end
  
  end