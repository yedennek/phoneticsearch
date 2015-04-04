require_relative "../lib/phonetic_searcher"

surname_list = $stdin.read.lines.map(&:chomp)
searcher = PhoneticSearcher.new surname_list

ARGV.each {|name| puts "#{name}: #{searcher.find_matches(name).inspect}" }
