class Words::AdjectivesController < ApplicationController
  def new
    @adjectives = Words::FindAdjectives.new
  end

  def show
    @adjectives = Words::FindAdjectives.run(word_params)
    unless @adjectives.valid?
      redirect_ to words_find_adjectives_path, notice: 'Sorry, that query is invalid.'
    end
  end

  private

  def word_params
    params.require(:words_find_adjectives).permit(:noun)
  end
end
