class Words::TriggersController < ApplicationController
  before_action :authenticate_user!

  def new
    @triggers = Words::FindTriggers.new
  end

  def show
    @triggers = Words::FindTriggers.run(trigger_params)
    if @triggers.valid?
      ahoy.track 'Search for trigger words succeeded', word: @triggers.word,
        result: @triggers.result
    else
      ahoy.track 'Search for trigger words failed', word: @triggers.word
    end
  end

  private

  def trigger_params
    params.require(:words_find_triggers).permit(:word)
  end
end
