require 'active_support/core_ext/string'

module Metallum
  class Album

    attr_accessor :band_url
    
    def initialize(album_page = "") 
      @page = album_page
    end

    def album_id
      @page.uri.to_s.match(/\/albums\/(.*)/)[1]
    end

    def title
      element = @page.search("//h1[@class='album_name']")
      element.text
    end

    def band_name
      element = @page.search("//h2[@class='band_name']")
      element.text
    end

    def band_id
      element = @page.search("//h2[@class='band_name']//a")
      href = element.attribute('href').text
      href.match(/\/bands\/(.*)/)[1]
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

    def review_count
      element = @page.search("//*[@id='album_info']/dl[2]/dd[3]/text()[1]")
      count = element.text.squish
      count == "None yet" ? 0 : count
    end

    def review_score
      element = @page.search("//*[@id='album_info']/dl[2]/dd[3]/text()[2]")
      score = element.text
      score = score.match(/\.(.*)%/)
      score ? score[1].squish : 0
    end

    def cover_url
      element = @page.search("//a[@id='cover']//img")
      unless element.empty?
        element.attribute("src").text
      end
    end

    def track_list
      tracks = []
      elements = @page.search("//table[@class='display table_lyrics']//tbody//tr[@class='odd' or @class='even']")
      elements.each do |element|
        track = Track.new
        track.title = element.children[3].text.strip
        track.duration = element.children[5].text.strip
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
