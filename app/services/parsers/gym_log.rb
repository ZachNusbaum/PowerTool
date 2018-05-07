class Parsers::GymLog < ActiveInteraction::Base
  FILTER = /^(?<month>\d{2})\/(?<day>\d{2})\/(?<year>\d{4})\s(?<time>(?<hour>\d{2}):(?<minute>\d{2})\s(?<meridian>AM|PM))\s(PST|PDT)\s(?<club>.+)\s*$/
  string :raw_log

  def execute
    result = []
    get_matches.each do |match|

      data = {
          time: Chronic.parse("#{match[0]}/#{match[1]}/#{match[2]} #{match[4]}:#{match[5]} #{match[6]}"),
          location: match[7]
      }
      result << data
    end

    result
  end

  private

  def get_matches
    raw_log.scan(FILTER)
  end

end