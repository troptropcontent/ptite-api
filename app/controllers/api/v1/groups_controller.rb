class Api::V1::GroupsController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create
    new_group = current_user.groups.create({name: group_params[:name] })
    users_rehydrated = group_params[:users].map{|user_id| User.find(user_id)}
    users_rehydrated.each{|user| new_group.group_members.create({user: user})}
    
    render json: new_group.serialized

  end

  def index
    users = current_user.events
    
    # render json: {events: events}
    
  end  
  
  
  private 

  def group_params
    params.permit(:name,:users => [])
  end

end
