require 'rails_helper'

RSpec.feature "Editing an Article" do
  before do
    @article = Article.create(title: "This is the best article, read it!", body: "You can also pass a block to both 2.x and 3.x+ processor interfaces, however the number of args the method takes has changed so it's very hard to do that method and support multiple processor interfaces.")
  end
  
  scenario "A user updates an article" do
    visit "/"
    
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: "Updated Article"
    fill_in "Body", with: "UPDATE: This is the best article, read it!"
    click_button "Update Article"
    
    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
  
  scenario "A user fails to update an article" do
    visit "/"
    
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: "UPDATE: This is the best article, read it!"
    click_button "Update Article"
    
    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
  
end