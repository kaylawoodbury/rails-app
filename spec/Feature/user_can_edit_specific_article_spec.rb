require "rails_helper"

feature 'User can edit a specific article' do
    before do
        create(:article, title: 'A breaking news item', content: 'Some breaking action')
      
        visit root_path
        click_on 'A breaking news item'
        click_on "Edit"
        fill_in "article_title", with: "New breaking news"
        fill_in "article_content", with: "Updated news here"
        click_on "Update Article"
    end       
            

    it 'title' do
        expect(page).to have_content 'New breaking news'
    end

    it 'content' do
        expect(page).to have_content 'Updated news here'
    end

    it 'User should see success message' do
        expect(page).to have_content 'Article updated'
      end

end