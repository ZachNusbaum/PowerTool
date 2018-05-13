class Users::EventsController < ApplicationController
  before_action :authenticate_user!
  layout 'semantic'
  
  def index
    @events = current_user.events
  end
end
