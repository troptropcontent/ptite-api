class Api::V1::GroupsController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create
    raise

  end

  def index
    users = current_user.events
    
    # render json: {events: events}
    
  end  
  
  
  private 

  def group_params
    params.permit(:name, :users)
  end

end
