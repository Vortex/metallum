module Metallum

  class Agent

    def initialize(band_url)
      @agent = Mechanize.new
      @page = @agent.get(band_url)
    end

    def fetch_band
      band = Band.new(@page) 
    end

  end

  class Band

    def initialize(band_page)
      @page = band_page
    end

    def name
      element = @page.search("h1[@class='band_name']")
      element.text.strip!
    end

  end

end
