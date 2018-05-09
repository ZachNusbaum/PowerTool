class Parsers::GymLogsController < ApplicationController
  before_action :authenticate_user!
  def new
    @parser = Parsers::GymLog.new
  end

  def create
    @parser = Parsers::GymLog.run(log_params)
    ahoy.track 'Parsed gym log', member_id: current_user.member_id
    render :new
  end

  private

  def log_params
    params.require(:parsers_gym_log).permit(:raw_log)
  end
end
