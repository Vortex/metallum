require 'spec_helper'

describe "Band" do

  before(:each) do
    @band_url = 'http://www.metal-archives.com/bands/Blind_Guardian/3'
    @agent = Metallum::Agent.new(@band_url)
    @band = @agent.fetch_band
  end

  it "should fetch a band's name from url for band 'Hell'" do
    @band_url = 'http://www.metal-archives.com/bands/Hell/5849'
    @agent = Metallum::Agent.new(@band_url)
    band = @agent.fetch_band
    band.name.should == "Hell"
  end
  
  it "should fetch the band's name from url for band 'Blind Guardian'" do
    @band.name.should == "Blind Guardian"
  end

  it "should fetch the band's country of origin" do
    @band.country.should == "Germany"
  end

  it "should fetch the band's location" do
    @band.location.should == "Krefeld, North Rhine-Westphalia"
  end

  it "should fetch band's status" do
    @band.status.should == "Active"
  end

  it "should fetch the band's year of creation" do
    @band.year_formed.should == "1986"
  end

  it "should fetch the band's genre" do
    @band.genre.should == "Speed Metal (early), Power Metal (Later)"
  end

  it "should fetch band's lyrical themes" do
    @band.lyrical_themes.should == "Epic Tales, Legends, Fantasy, Tolkien, Literature"
  end

  it "should fetch band's record label" do
    @band.record_label.should == "Nuclear Blast Records"
  end

  it "should fetch band's photo url" do
    @band.photo_url.should == "http://www.metal-archives.com/images/3/3_photo.jpg"
  end

  it "should fetch band's logo url" do
    @band.logo_url.should == "http://www.metal-archives.com/images/3/3_logo.gif"
  end

  it "should fetch array of album urls" do
    @band.album_urls[0] = "http://www.metal-archives.com/albums/Blind_Guardian/Battalions_of_Fear/9"
    @band.album_urls[3] = "http://www.metal-archives.com/albums/Blind_Guardian/Follow_the_Blind/10"
  end

end

