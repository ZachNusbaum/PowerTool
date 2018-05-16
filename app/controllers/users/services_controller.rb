class Users::ServicesController < ApplicationController
  def index
    @services = current_user.services
  end
end
