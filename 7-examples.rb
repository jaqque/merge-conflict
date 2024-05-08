# 7 Interesting Ruby Code Examples
# https://www.rubyguides.com/2019/02/ruby-code-examples/

# sum of two numbers
def sum_eq_n?(arr, n)
  return true if arr.empty? && n == 0

  arr.product(arr).reject { |a,b| a == b }.any? { |a,b| a + b == n }
end

# counting, mapping, & finding
def find_missing(sequence)
  consecutive     = sequence.each_cons(2)
  differences     = consecutive.map { |a,b| b - a }
  sequence        = differences.max_by { |n| differences.count(n) }

  missing_between = consecutive.find { |a,b| (b - a) != sequence }

  missing_between.first + sequence
end

find_missing([2,4,6,10])
# 8

# regular expression example
def alternating_characters?(s)
  type = [/[aeiou]/, /[^aeiou]/].cycle

  if s.start_with?(/[^aeiou]/)
    type.next
  end

  s.chars.all? { |ch| ch.match?(type.next) }
end

alternating_characters?("ateciyu")
# true

# recursion & stack example
## recursion
def get_numbers(list, index = 0, taken = [])
  return [taken] if index == list.size

  get_numbers(list, index+1, taken) +
  get_numbers(list, index+1, taken + [list[index]])
end

get_numbers([1,2,3])

## stack
def get_numbers_stack(list)
  stack  = [[0, []]]
  output = []

  until stack.empty?
    index, taken = stack.pop

    next output << taken if index == list.size

    stack.unshift [index + 1, taken]
    stack.unshift [index + 1, taken + [list[index]]]
  end

  output
end

# method chaining example
def longest_repetition(string)
  max = string
          .chars
          .chunk(&:itself)
          .map(&:last)
          .max_by(&:size)

  max ? [max[0], max.size] : ["", 0]
end

longest_repetition("aaabb")
# ["a", 3]

# with index example
def reverse_alternate(string)
  string.gsub(/[^\s]+/).with_index { |w, idx| idx.even? ? w : w.reverse }
end

reverse_alternate("Apples Are Good")
# "Apples erA Good"

# each with object example
def clean_string(str)
  str
    .chars
    .each_with_object([]) { |ch, obj| ch == "#" ? obj.pop : obj << ch }
    .join
end

clean_string("aaa#b")
