# frozen_string_literal: true

def file(name)= File.read(File.join(__dir__, name.to_s))
def result(num, name)= send("part#{num}", *parse(file(name)))
def output(num, name)= puts "Part #{num} (#{name}): #{result(num, name)}"

def parse(input)= input.each_line.map { _1.split(" ").map(&:to_i) }
def to_diffs(levels)= levels.each_cons(2).map { (_1 - _2) }
def safe?(diffs)= same_dir?(diffs) && valid_scale?(diffs)
def same_dir?(diffs)= diffs.all?(&:positive?) || diffs.all?(&:negative?)
def valid_scale?(diffs)= diffs.all? { [1, 2, 3].include?(_1.abs) }

def part1(*data)= data.count { safe?(to_diffs(_1)) }
def part2(*data)= data.count { |levels| perms(levels).any? { safe?(to_diffs(_1)) } }

output(1, :example)
output(1, :input)

output(2, :example)
# output(2, :input)