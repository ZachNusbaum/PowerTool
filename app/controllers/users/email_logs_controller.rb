class Users::EmailLogsController < ApplicationController
  before_action :authenticate_user!
  layout 'semantic'
  
  def index
    @messages = current_user.messages
  end
end
