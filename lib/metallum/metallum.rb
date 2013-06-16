module Metallum
  # DISCOGRAPHY_URL = "http://www.metal-archives.com/band/discography/id/3/tab/all"

  class Agent

    def initialize(url = "")
      @agent = Mechanize.new
      @page = @agent.get(url)
      @discography = @agent.get("http://www.metal-archives.com/band/discography/id/#{extract_band_id}/tab/all")
    rescue
      # TODO: PD: Code smell
      # Do nothing
    end

    def fetch_band
      band = Band.new(@page, @discography)
    end

    def fetch_album
      album = Album.new(@page)
    end

    def self.fetch_albums_for(month, year)
      month_from, month_to = month, month
      year_from, year_to = year, year

      albums = []
      albumsData = []

      offset = 0
      totalRecords = 10000
      while (offset < totalRecords) do
        puts "Total records: #{totalRecords}"
        puts "Offset: #{offset}"
        url = "http://metal-archives.com/search/ajax-advanced/searching/albums/?releaseYearFrom=#{year_from}&releaseMonthFrom=#{month_from}&releaseYearTo=#{year_to}&releaseMonthTo=#{month_to}&releaseType[]=1&iDisplayStart=#{offset}&iDisplayLength=300"       
        uri = URI.encode(url)
        result = HTTParty.get(uri) 
        puts "Album count: #{result['aaData'].size}"
        totalRecords = result["iTotalRecords"]
        albumsData += result["aaData"]
        offset += 200
      end
     
      albumsData.each do |albumData|
        doc = Nokogiri::HTML.parse(albumData[1])
        href = doc.css('a')[0]["href"]
        puts href
        agent = Metallum::Agent.new(href)
        album = agent.fetch_album
        albums << album
      end

      albums
    end

    def extract_band_id
      @page.uri.to_s.match(/\/(\d+)/)[1]
    end 

  end

end
