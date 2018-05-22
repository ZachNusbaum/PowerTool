class Words::FindTriggers < ActiveInteraction::Base
  string :word

  validates :word, presence: true

  def execute
    WordDescriptor.words.that_are_triggered_by(word).fetch
  end
end
