require 'rails_helper'

describe "get all quotes route", :type => :request do
  let!(:quotes) { FactoryBot.create_list(:quote, 20)}

  before { get '/quotes'}

  it 'returns all quotes' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe "get a post route", :type => :request do
  let!(:quotes) { FactoryBot.create_list(:quote, 20)}

  before { get '/quotes/3'}

  it 'returns a 404 :not_found for bad GET request' do
    expect(response).to have_http_status(:not_found)
  end
end

describe "search a post route", :type => :request do
  before do
    post '/quotes', params: { :author => 'test_name', :content => 'test_content' }
    post '/quotes', params: { :author => 'test_author', :content => 'test_content' }
    get "/quotes?search=name"
  end

  it 'returns the searched post' do
    expect(JSON.parse(response.body).first['author']).to eq('test_name')
  end
end
