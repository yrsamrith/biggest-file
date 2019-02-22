#!/usr/bin/env ruby

files = {}

if Dir.entries('.').size <= 3
    puts "ERROR: Empty directory."
    exit(1)
end

Dir.entries('.').select{ |f| File.file? f }.select { |f| f != File.basename($0) }.each do |filename|
    files[filename] = (File.size(filename) / 1024.0).round(4)
end

biggest_file = files.sort_by { |key, value| value }.last

puts biggest_file[0]
puts biggest_file[1].to_s + 'MB'
