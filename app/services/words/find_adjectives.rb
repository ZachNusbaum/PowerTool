class Words::FindAdjectives < ActiveInteraction::Base
  string :noun

  validates :noun, presence: true

  def execute
    query = WordDescriptor.words.that_describe(noun)
    query.fetch
  end
end
