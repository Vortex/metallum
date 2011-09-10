require 'spec_helper'

describe "Album" do

  before(:each) do
    @album_url = "http://www.metal-archives.com/albums/Dream_Theater/A_Dramatic_Turn_of_Events/309671"
    @agent = Metallum::Agent.new(@album_url)
    @album = @agent.fetch_album
  end

  it "should fetch the title of the album" do
    @album.title.should == "A Dramatic Turn of Events"
  end

end
