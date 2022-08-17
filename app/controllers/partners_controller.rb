# frozen_string_literal: true

class PartnersController < ApplicationController
  #
  # GET /requests/:request_id/partners
  #
  # Responds with JSON
  def index
    render json: Request.find(params[:request_id]).partners.order("rating DESC, distance ASC")
  end

  #
  # GET /partners/:id
  #
  def show
    render json: Partner.find(params[:id])
  end
end
