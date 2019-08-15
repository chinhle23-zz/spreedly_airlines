class FlightsController < ApplicationController
  include FlightsHelper

  def index
    @flights = Flight.all
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.save
    flash.notice = "Flight to '#{@flight.destination}' Created!"
    redirect_to flight_path(@flight)
  end

  def show
    @flight = Flight.find(params[:id])
    @environment_key = Rails.configuration.spreedly['environment_key']
    @transaction = Transaction.new
    @transaction.flight_id = @flight.id
  end
end
