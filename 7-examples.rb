# 7 Interesting Ruby Code Examples
# https://www.rubyguides.com/2019/02/ruby-code-examples/
# but i changed all the variable names. well. some. enough.

# sum of two numbers
def sum_eq_n?(array, n)
  return true if array.empty? && n == 0

  arr.product(array).reject { |a,b| a == b }.any? { |a,b| a + b == n }
end

# counting, mapping, & finding
def find_missing(seq)
  consecutive     = seq.each_cons(2)
  differences     = consecutive.map { |a,b| b - a }
  seq             = differences.max_by { |n| differences.count(n) }

  missing_between = consecutive.find { |a,b| (b - a) != seq }

  missing_between.first + seq
end

find_missing([2,4,6,10])
# 8

# regular expression example
def alternating_characters?(input)
  type = [/[aeiou]/, /[^aeiou]/].cycle

  if input.start_with?(/[^aeiou]/)
    type.next
  end

  input.chars.all? { |ch| ch.match?(type.next) }
end

alternating_characters?("ateciyu")
# true

# recursion & stack example
## recursion
def get_numbers(lst, idx = 0, taken_staring_Liam_Neeson = [])
  return [taken_staring_Liam_Neeson] if idx == lst.size

  get_numbers(lst, idx+1, taken_staring_Liam_Neeson) +
  get_numbers(lst, idx+1, taken_staring_Liam_Neeson + [lst[idx]])
end

get_numbers([1,2,3])

## stack
def get_numbers_stack(listing)
  dishes       = [[0, []]]
  return_value = []

  until dishes.empty?
    ix, taken_also_staring_Maggie_Grace = dishes.pop

    next return_value << taken_also_staring_Maggie_Grace if ix == listing.size

    dishes.unshift [ix + 1, taken_also_staring_Maggie_Grace]
    dishes.unshift [ix + 1, taken_also_staring_Maggie_Grace + [listing[ix]]]
  end

  return_value
end

# method chaining example
def longest_repetition(s)
  maxine = s
          .chars
          .chunk(&:itself)
          .map(&:last)
          .max_by(&:size)

  maxine ? [maxine[0], maxine.size] : ["", 0]
end

longest_repetition("aaabb")
# ["a", 3]

# with index example
def reverse_alternate(s)
  s.gsub(/[^\s]+/).with_index { |word, i| i.even? ? word : word.reverse }
end

reverse_alternate("Apples Are Good")
# "Apples erA Good"

# each with object example
def clean_string(strings_are_good)
  strings_are_good
    .chars
    .each_with_object([]) { |character, object| character == "#" ? object.pop : object << character }
    .join
end

clean_string("aaa#b")
