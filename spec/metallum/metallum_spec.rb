# coding: utf-8
# require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'spec_helper'

describe Metallum do

  context "count fetched albums by month and year" do
    it "for March 2015" do
      VCR.use_cassette("fetch_albums_for_march_2015") do 
        @albums = Metallum::Agent.fetch_albums_for(3, 2015)
        @albums.size.should eq 375
      end
    end

    it "for April 2015" do
      VCR.use_cassette("fetch_albums_for_april_2015") do 
        @albums = Metallum::Agent.fetch_albums_for(4, 2015)
        @albums.size.should eq 114
      end
    end
  end

  context "fetch individual album data by month and year" do

    it "and check the first album" do
      VCR.use_cassette("fetch_albums_for_february_2015") do 
        @albums = Metallum::Agent.fetch_albums_for(2, 2015)
        @albums[0].title.should eq "Horizon"
      end
    end

  end

end
