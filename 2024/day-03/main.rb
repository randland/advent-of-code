# frozen_string_literal: true

def file(name)= File.read(File.join(__dir__, name.to_s))
def result(num, name)= send("part#{num}", *parse(file(name)))
def output(num, name)= puts "Part #{num} (#{name}): #{result(num, name)}"

def parse(input)= input.gsub("\n", "")

MULT = /mul\((\d+),(\d+)\)/ # matches valid `mul(X,Y)`
CONTROL = /(do\(\)|don't\(\))/ # matches valid `do()` and `don't()``

def mult(vals)= vals.map(&:to_i).reduce(:*)

def part1(data)= data.scan(MULT).map(&method(:mult)).sum

def part2(data)
  enabled = true
  sum = 0

  data.scan(/#{CONTROL}|#{MULT}/).each do |match|
    case match[0]
    when "do()"
      enabled = true
    when "don't()"
      enabled = false
    else
      sum += mult(match[1..]) if enabled
    end
  end
  
  sum
end

output(1, :example1)
output(1, :input)

output(2, :example2)
output(2, :input)