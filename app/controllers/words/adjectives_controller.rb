class Words::AdjectivesController < ApplicationController
  before_action :authenticate_user!

  def new
    @adjectives = Words::FindAdjectives.new
  end

  def show
    @adjectives = Words::FindAdjectives.run(word_params)
    unless @adjectives.valid?
      redirect_ to words_find_adjectives_path, notice: 'Sorry, that query is invalid.'
      ahoy.track 'Invalid adjectives search', noun: @adjectives.noun
    else
      ahoy.track 'Successful adjective search', noun: @adjectives.noun
    end
  end

  private

  def word_params
    params.require(:words_find_adjectives).permit(:noun)
  end
end
