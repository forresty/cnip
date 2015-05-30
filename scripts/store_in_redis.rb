#!/usr/bin/env ruby

def ip_to_i(ip)
  ip_int = 0

  octets = ip.split('.')

  (0..3).each do |x|
    octet = octets.pop.to_i
    octet = octet << 8*x
    ip_int = ip_int | octet
  end

  ip_int
end

require "redis"
require "netaddr"

CIDRList = File.read(File.expand_path('../../data/chnroute.txt', __FILE__)).each_line.map do |s|
  NetAddr::CIDR.create(s.chomp)
end

@redis = Redis.new

def range_to_str(range)
  ("\0" * (range.begin/8) + "\xFF" * (range.size/8)).force_encoding('ASCII-8BIT')
end

def prepare_bitmap
  CIDRList.each do |cidr|
    r = ip_to_i(cidr.first)..(ip_to_i(cidr.last))

    str = range_to_str(r)

    @redis.set('cn:ip:tmp', str)
    @redis.bitop('OR', 'cn:ip', 'cn:ip', 'cn:ip:tmp')

    p r
  end
end

def test
  require 'readline'

  loop do
    line = Readline::readline('> ')
    break if line.nil? || line == 'quit'
    Readline::HISTORY.push(line)
    puts @redis.getbit('cn:ip', ip_to_i(line.chomp))
  end
end
