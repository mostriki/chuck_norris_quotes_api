require 'rails_helper'



describe "delete a post route", :type => :request do
  before do
    post '/quotes', params: { :author => 'test_author', :content => 'test_content' }
    @y = Quote.first.id
    delete "/quotes/#{@y}?"
  end

  it 'returns a 200 ok status for update' do
    expect(response).to have_http_status(:success)
  end
end
