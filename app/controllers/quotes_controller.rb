class QuotesController < ApplicationController

  def index
    author = params[:author]
    if params[:search]
      @quotes = Quote.search(params[:search])
    else
      @quotes = Quote.all
    end
    json_response(@quotes)
  end

  def show
    @quote = Quote.find(params[:id])
    
    json_response(@quote)
  end

  def create
    @quote = Quote.create!(quote_params)
    if @quote
      render status: 201, json: { id: @quote.id,
                                  author: @quote.author,
                                  content: @quote.content,
                                  message: "Your quote has been created succesfully!" }
    end
  end

  def update
    @quote = Quote.find(params[:id])
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
  end

  private

  def quote_params
    params.permit(:author, :content)
  end
end
