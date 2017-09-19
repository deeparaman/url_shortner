# encoding: utf-8

require 'rails_helper'

RSpec.describe TinyUrl, type: :model do
  describe 'TinyUrl model' do
    it 'should validate fields' do
      expect(TinyUrl.new(full_url: '')).not_to be_valid
    end
    it 'should validate fields' do
      expect(TinyUrl.new(shortend_url: '')).not_to be_valid
    end
    it 'should validate fields' do
      expect(TinyUrl.new(full_url: 'https://www.google.co.in/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=How+do+i+get+my+console+to+display+test+results+in+color(red%2Fgreen)+in+ruby', shortend_url: 'd2f16d5')).to be_valid
    end
  end
  describe 'Generate tiny url' do
    it 'should generate_tiny_url tiny_url ' do
      tiny_url = TinyUrl.generate_tiny_url('https://www.relishapp.com/rspec/rspec-rails/docs/routing-specs')
      expect(tiny_url).to eq('7c9d2df')
    end
  end
  describe 'TinyUrl model' do
    it 'should find out full_url from database if exit' do
      TinyUrl.all.delete_all if TinyUrl.all
      tiny_url = FactoryGirl.create(:tiny_url)
      shortend_url = TinyUrl.find_or_initialize(tiny_url.full_url)
      expect(tiny_url).not_to eq(shortend_url)
    end
    it 'should find out full_url from database if exit' do
      tiny_url = FactoryGirl.create(:tiny_url)
      existing_url = TinyUrl.find_or_initialize(tiny_url.full_url)
      expect(tiny_url.full_url).to eq(existing_url.full_url)
    end
  end
end
