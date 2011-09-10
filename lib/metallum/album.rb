class Album
  
  def initialize(album_page) 
    @page = album_page
  end

  def title
    element = @page.search("//h1[@class='album_name']")
    element.text
  end

end
