class Clock
  attr_accessor :hours, :minutes

  def initialize(hours, minutes = 0)
    @hours, @minutes = hours, minutes
  end

  def -(min)
    self.minutes -= min
    h, m = convert_min_to_hr_min(minutes)
    self.hours = (hours + h) % (24)
    self.minutes = m
    self
  end

  def +(min)
    self.minutes += min
    h, m = convert_min_to_hr_min(minutes)
    self.hours = (hours + h) % (24)
    self.minutes = m
    self
  end

  def convert_min_to_hr_min(min)
    min.divmod(60)
  end

  def to_s
    "#{'%02d' % @hours}:#{'%02d' % @minutes}"
  end

   def ==(other)
    to_s == other.to_s
  end

  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end
end
