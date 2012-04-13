module Metallum
  class Album
    
    def initialize(album_page) 
      @page = album_page
    end

    def title
      element = @page.search("//h1[@class='album_name']")
      element.text
    end

    def band_name
      element = @page.search("//h2[@class='band_name']")
      element.text
    end

    def album_type
      element = @page.search("//div[@id='album_info']//dl[1]//dd[1]")
      element.text
    end

    def release_date
      element = @page.search("//div[@id='album_info']//dl[1]//dd[2]")
      element.text
    end

    def record_label
      element = @page.search("//div[@id='album_info']//dl[2]//dd[1]")
      element.text
    end

    def track_list
      tracks = []
      elements = @page.search("//div[@id='album_tabs_tracklist']//table//tbody//tr[@class='odd' or @class='even']")
      elements.each do |element|
        track = Track.new
        track.title = element.children[2].text.strip
        track.duration = element.children[4].text.strip
        tracks << track
      end
      return tracks
    end
    
    class Track

      attr_accessor :title, :duration

      def initialize
        @duration = "0:00"
      end

    end
       
  end
end
