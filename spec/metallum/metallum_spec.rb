# coding: utf-8
# require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'spec_helper'

describe Metallum do

  context "count fetched albums by month and year" do
    it "for June 2013" do
      VCR.use_cassette("fetch_albums_for_june_2013") do 
        @albums = Metallum::Agent.fetch_albums_for(6, 2013)
        @albums.size.should eq 256
      end
    end

    it "for May 2013" do
      VCR.use_cassette("fetch_albums_for_may_2013") do 
        @albums = Metallum::Agent.fetch_albums_for(5, 2013)
        @albums.size.should eq 396
      end
    end
  end

  context "fetch individual album data by month and year" do

    it "and check the first album" do
      VCR.use_cassette("fetch_albums_for_april_2013") do 
        @albums = Metallum::Agent.fetch_albums_for(4, 2013)
        @albums[0].title.should eq "Cursed Storm of Ages"
      end
    end

  end

end
