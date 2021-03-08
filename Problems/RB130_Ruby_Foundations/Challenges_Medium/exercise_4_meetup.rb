require 'date'

class Meetup
  ORDINAL = %w(first second third fourth fifth)
  attr_accessor :month

  def initialize(year, month)
    @month = (Date.new(year, month)..Date.new(year, month, -1)).to_a
  end

  def day(weekday, ordinal)
    weekday, ordinal = weekday.downcase, ordinal.downcase
    result = nil
    days = month.select { |day| weekday?(weekday, day) }
    days.each_with_index do |day, idx|
      if ordinal == 'last'
        result = days.last
      elsif ordinal == 'teenth'
        result = day if month.slice(12, 7).include?(day)
      else
        result = day if ordinal== ORDINAL[idx]
      end
    end
    result
  end

  private

  def weekday?(mon_fri, day)
    case mon_fri
    when 'monday'     then day.monday?
    when 'tuesday'    then day.tuesday?
    when 'wednesday'  then day.wednesday?
    when 'thursday'   then day.thursday?
    when 'friday'     then day.friday?
    when 'saturday'   then day.saturday?
    else                   day.sunday?
    end
  end
end
