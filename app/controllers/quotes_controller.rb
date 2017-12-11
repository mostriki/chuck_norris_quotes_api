class QuotesController < ApplicationController

  def index
    @quotes = Quote.all
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
    if @quote.update!(quote_params)
      render status: 200, json: {
        message: "Your quote has been updated succesfully."
      }
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def quote_params
    params.permit(:author, :content)
  end
end
