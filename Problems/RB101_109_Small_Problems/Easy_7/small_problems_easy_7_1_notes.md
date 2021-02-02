Write a method that combines two Arrays passed in as arguments, and returns a
new Array that contains all elements from both Array arguments, with the
elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same
number of elements.

*******************************************************************************
P-roblem
  Input:

    - two different arrays that are the same size
    Output:
        - one array that has the corresponding element in alternating order from the previous two arrays
      Rules:
            Explicit requirements:
      - return a new single array comprised of two previous elements
      - elements must be in alternating order
      -
        Implicit requirements:
      - new array size should be the cumulative size of both array
      - two parameter in method definition
      - elements can be any data structure

E-xamples / Test cases Below

D-ata Structure
  -
  -

A-lgorithm - How would I solve this?
  -
  -
C - Code Below

*******************************************************************************
=end

```ruby class:"lineNo"
def interleave(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |ele, index|
    new_arr << ele
    new_arr << arr2[index]
  end
  new_arr
end
# for this excercise
# a = [1, 2, 3]
# b = ['a', 'b', 'c']
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
```

On `lines 1-8` the method `interleave` is defined which takes two parameters. On `line 10` the method `interleave` is invoked and passing in the two arrays `a` and `b` as an argument. 

On `line 2`  the local variable `new_arr` is initialized and assigned to an empty array `[]` .

On `line 3` the method `each_with_index` is invoked on the array `arr1` and passing in the `do..end` block as an argument with two parameters `ele` and `index`.

On `line 4` the `append/push`.ie `<<` method is invoked on the array `new_arr` and passes the `ele` from `arr1` as an argument >> **Is this statement correct? or is it a parameter** <<. The `append/push/<<` method adds the passed object to the end of the receiving array.

On `line 5` we repeat what `line 4` did, the only difference is that the passed object is different. The

`[]` method is invoked on the array `aar2` and passes `index` as the argument. The `[]` method allows access to the elements inside of an array by calling on t 



























