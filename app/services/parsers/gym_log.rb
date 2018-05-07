class Parsers::GymLog < ActiveInteraction::Base
  FILTER = /^(?<month>\d{2})\/(?<day>\d{2})\/(?<year>\d{4})\s(?<time>(?<hour>\d{2}):(?<minute>\d{2})\s(?<meridian>AM|PM))\s(PST|PDT)\s(?<club>.+)\s*$/
  string :raw_log

  def execute
    get_matches
  end

  private

  def get_matches
    raw_log.scan(FILTER)
  end

end