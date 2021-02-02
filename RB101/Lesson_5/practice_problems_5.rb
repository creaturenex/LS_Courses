# Given this nested Hash:

munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
#   figure out the total age of just the male members of the family.

#   Show Solution

total_male_age = 0

munsters.each do |k, v|
    if munsters[k]["gender"] == "male"
      total_male_age += munsters[k]["age"]
    end
end

p total_male_age

#LS solution

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

# total_male_age # => 444
# In this example, within each key-value pair in the outer hash the value is itself a hash. When iterating through the outer hash, we need to access two values from each inner hash.

# Since we're not referencing the key (each family member's name) from the key-value pairs in the outer hash, we can use Hash#each_value with a single block parameter.
