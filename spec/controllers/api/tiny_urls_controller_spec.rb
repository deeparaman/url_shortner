# encoding: utf-8

require 'rails_helper'

RSpec.describe Api::TinyUrlsController, type: :controller do
  before(:each) do
    @tiny_url = {
      full_url: 'https://www.quora.com/What-happened-to-the-wonderful-RubyMonk-online-Ruby-tutorial'
    }
    @tiny_url_data = {
      full_url: 'qwertyuiopasdfghjkl'
    }
  end
  describe 'Post #Create' do
    it 'should create new tiny_url from a long url' do
      post :create, { tiny_url: @tiny_url }, format: :json
      tiny_url = TinyUrl.last
      expect(tiny_url.shortend_url).to eq('11262d7')
      json_response = JSON.parse(response.body)
      message = 'Shortend Url Created Successfully'
      expect(json_response['message']).to eq(message)
      expect(response.status).to eq(200)
    end
    it 'should return invalid url message if url is not valid' do
      post :create, { tiny_url: @tiny_url_data }, format: :json
      json_response = JSON.parse(response.body)
      message = 'Invalid url. Please enter a valid url'
      expect(json_response['message']).to eq(message)
      expect(response.status).to eq(400)
    end
    it 'should return tiny_url if already exist in database' do
      full_url = 'https://www.quora.com/What-happened-to-the-wonderful-RubyMonk-online-Ruby-tutorial'
      url = '11262d7'
      tiny_url_data = TinyUrl.create(full_url: full_url, shortend_url: url)
      post :create, { tiny_url: @tiny_url }, format: :json
      json_response = JSON.parse(response.body)
      message = 'Shortend Url Created Successfully'
      expect(json_response['message']).to eq(message)
      expect(tiny_url_data.id).to eq(TinyUrl.last.id)
      expect(response.status).to eq(200)
    end
  end

  describe 'Get #redirect_to_url' do
    it 'return no data found message if not match' do
      shortend_url = { shortend_url: '3907215' }
      get :redirect_to_url, params: shortend_url
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('No Url Found')
      expect(response.status).to eq(404)
    end
    it 'return no data found message if not match' do
      tiny_url_data = FactoryGirl.create(:tiny_url)
      url = { a: '?a123d' }
      get :redirect_to_url, params: url
      expect(response).to redirect_to(tiny_url_data.full_url)
      expect(response.status).to eq(302)
    end
  end
end
