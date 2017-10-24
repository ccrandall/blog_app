require 'rails_helper'

RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: "Creating first article"
    fill_in "Body", with: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eleifend nisi id nibh bibendum, sed scelerisque justo finibus. Mauris tempus ante risus, sed ultrices ex pretium commodo. Vestibulum fringilla sodales eros eget egestas. Etiam sed velit consequat tortor lobortis ullamcorper in eu libero. Pellentesque maximus magna ex, sit amet sagittis odio ullamcorper a. Donec sed ex scelerisque, scelerisque justo vel, dictum nisl. Integer ornare eleifend libero vulputate pretium. Phasellus a tortor consequat, dignissim tellus sed, interdum eros. Sed libero eros, dapibus at gravida nec, interdum quis neque. Nam tincidunt elit quis est euismod bibendum. Phasellus nec varius mi. Vivamus vel tempor neque. Pellentesque pulvinar nulla erat. In quis est quis libero consequat hendrerit. Aliquam at leo ullamcorper, vulputate est id, maximus massa. Nunc non ipsum id massa aliquet efficitur vel at enim."
    click_button "Create Article"
    
    expect(page).to have_content("Article has been created")
    expect(page.current_path).to eq(articles_path)
    
  end
  
  scenario "A user fails to create a new article" do
    visit "/"
    
    click_link "New Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create Article"
    
    expect(page).to have_content("Article has not been created.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end