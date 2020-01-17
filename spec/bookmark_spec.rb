require 'bookmark'

describe Bookmark do
  describe '.all' do    # the . in front of the method name indicates that it is a class method    # is used for instance methods 
    it 'returns all bookmarks' do
      
      bookmarks = Bookmark.all # call the class method all on the Bookmark class 
      expect(bookmarks.first.title).to eq 'BBC'
      expect(bookmarks.last.title).to eq "Twitter"
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com')
      persisted_data = persisted_data(id: bookmark.id)
  
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end

  describe '.delete' do
    it 'deletes bookmark from database' do
      test_bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      p Bookmark.all
      Bookmark.delete(id: test_bookmark.id)
      p Bookmark.all

      expect(Bookmark.all.length).to eq 3
      
    end
  end
end