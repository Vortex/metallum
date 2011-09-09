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

    def country
      element = @page.search("//div[@id='band_info']//dl//dd[1]//a")
      element.children[0].text
    end

    def location
      element = @page.search("//div[@id='band_info']//dl[1]//dd[2]")
      element.text
    end

    def status
      element = @page.search("//div[@id='band_info']//dl[1]//dd[3]")
      element.text
    end

    def year_formed
      element = @page.search("//div[@id='band_info']//dl//dd[4]")
      element.text
    end

    def genre
      element = @page.search("//div[@id='band_info']//dl[2]//dd[1]")
      element.text
    end

    def lyrical_themes
      element = @page.search("//div[@id='band_info']//dl[2]//dd[2]")
      element.text
    end

    def record_label
      element = @page.search("//div[@id='band_info']//dl[2]//dd[3]")
      element.text
    end

    def photo_url
      element = @page.search("//a[@id='photo']//img")
      element.attribute("src").text
    end

    def logo_url
      element = @page.search("//a[@id='logo']//img")
      element.attribute("src").text
    end

  end

end
