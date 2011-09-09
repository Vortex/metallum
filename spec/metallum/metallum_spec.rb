# coding: utf-8
# require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'spec_helper'

describe Metallum do

  it "should fetch a band's name from url for band 'Hell'" do
    band_url = 'http://www.metal-archives.com/bands/Hell/5849'
    @agent = Metallum::Agent.new(band_url)
    band = @agent.fetch_band
    band.name.should == "Hell"
  end
  
  it "should fetch a band's name from url for band 'Blind Guardian'" do
    band_url = 'http://www.metal-archives.com/bands/Blind_Guardian/3'
    @agent = Metallum::Agent.new(band_url)
    band = @agent.fetch_band
    band.name.should == "Blind Guardian"
  end

end
