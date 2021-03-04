class Robot
  @@oldname = []
  attr_accessor :name

  def initialize
    @name = generate_name
    @name = generate_name if @@oldname.include? name
    @@oldname << name

  end

  def generate_name
    ('AA'..'ZZ').to_a.sample + ('001'..'999').to_a.sample
  end

  def reset
    initialize
  end

  def self.oldname
    p @@oldname
  end

end


a = Robot.new
p a.name
a.class.oldname

b = Robot.new
p b.name
b.class.oldname

# continue not exactly finished, this works but need to compare to LS
