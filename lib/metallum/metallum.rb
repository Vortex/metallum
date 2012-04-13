module Metallum

  # DISCOGRAPHY_URL = "http://www.metal-archives.com/band/discography/id/3/tab/all"

  class Agent

    def initialize(url)
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

    def extract_band_id
      @page.uri.to_s.match(/\/(\d+)/)[1]
    end

  end

end
