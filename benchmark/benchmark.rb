#!/usr/bin/env ruby
require 'benchmark'
require 'cnip'

Benchmark.bmbm do |x|
  x.report { 100.times { CNIP.include?('8.8.8.8') } }
end
