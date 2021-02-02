class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Dog

  def swim
    nil
  end

  def fetch
    nil
  end

end

cat = Cat.new
puts cat.swim
