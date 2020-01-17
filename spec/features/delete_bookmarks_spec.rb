feature 'delete bookmark' do
  scenario 'user deletes bookmark from Bookmark Manager' do
  
    visit('/bookmarks')
    expect(page).to have_link('BBC', href: 'https://www.bbc.co.uk/news')

    first('.bookmark').click_button 'Delete' 
    # finds the first element within the bookmark class and clicks the delete button

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('BBC', href: 'https://www.bbc.co.uk/news')
  end
end
