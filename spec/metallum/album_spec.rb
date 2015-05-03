require 'spec_helper'

describe "Album" do

  before(:all) do
    VCR.use_cassette('album') do
      @album_url = "http://www.metal-archives.com/albums/Dream_Theater/A_Dramatic_Turn_of_Events/309671"
      @agent = Metallum::Agent.new(@album_url)
      @album = @agent.fetch_album
    end
  end

  context "album info" do

    it "should fetch the title of the album" do
      @album.title.should == "A Dramatic Turn of Events"
    end

    it "should fetch the name of the band" do
      @album.band_name.should == "Dream Theater"
    end

    it "should fetch the type of the album" do
      @album.album_type.should == "Full-length"
    end

    it "should fetch the release date" do
      @album.release_date.should == "September 13th, 2011"
    end

    it "should fetch the record label" do
      @album.record_label.should == "Roadrunner Records"
    end

    it "should fetch the number of reviews" do
      @album.review_count.should == "23"
    end

    it "should fetch the average review score" do
      @album.review_score.should == "82"
    end

    it "should fetch track list" do
      @album.track_list.size == 9
    end

    it "should fetch track titles" do
      @album.track_list[0].title.should == "On the Backs of Angels"
      @album.track_list[8].title.should == "Beneath the Surface"
    end

    it "should fetch the track length" do
      @album.track_list[3].duration.should == "06:57"
      @album.track_list[6].duration.should == "03:56"
    end

  end

end
