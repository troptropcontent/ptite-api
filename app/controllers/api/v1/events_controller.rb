class Api::V1::EventsController < ApplicationController
  def index
    events = current_user.events
    render json: {events: events}
    
  end  


end
