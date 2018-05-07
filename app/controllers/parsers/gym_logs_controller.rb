class Parsers::GymLogsController < ApplicationController
  before_action :authenticate_user!
  def new
    @parser = Parsers::GymLog.new
  end

  def create
    @parser = Parsers::GymLog.run(log_params)
    render :new
  end

  private

  def log_params
    params.require(:parsers_gym_log).permit(:raw_log)
  end
end
