# frozen_string_literal: true

def file(name)= File.read(File.join(__dir__, name.to_s))
def result(num, name)= send("part#{num}", *parse(file(name)))
def output(num, name)= puts "Part #{num} (#{name}): #{result(num, name)}"

def parse(input)= input.each_line.map { _1.split(/\s+/).map(&:to_i) }.transpose
def count_vals(arr)= arr.group_by(&:itself).transform_values(&:count)

def part1(a, b)= a.sort.zip(b.sort).sum { (_1 - _2).abs }
def part2(*data)
  a, b = data.map(&method(:count_vals))
  a.keys.sum { _1 * (a[_1] || 0) * (b[_1] || 0) }
end

output(1, :example)
output(1, :input)

output(2, :example)
output(2, :input)