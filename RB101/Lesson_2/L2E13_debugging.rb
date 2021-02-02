def car(new_car)
  make = make(new_car)
  model = model(new_car)
  [make, model]
end

def make(new_car)
  new_car.split(" ")[0]
end

def model(new_car)
  new_car.split(" ")[1] #[2]
end

make, model = car("Ford Mustang")
make == "Ford"         # => true
model.start_with?("M")
# => NoMethodError: undefined method `start_with?' for nil:NilClass
# Ths error occured because line 12 was originally [2] and the array
# [make.model] only has 2 elements, and arrays always start their index at 0.
