require "rails_helper"

RSpec.feature "Showing an Article" do
  
  before do
    @article = Article.create(title: "This is the best article, read it!", body: "You can also pass a block to both 2.x and 3.x+ processor interfaces, however the number of args the method takes has changed so it's very hard to do that method and support multiple processor interfaces.")
  end
  
  scenario "Display individual article" do
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(page.current_path).to eq(article_path(@article))
  end
end