require "cnip/version"

require "netaddr"

module CNIP
  class << self
    CIDRList = File.read(File.expand_path('../../data/chnroute.txt', __FILE__)).each_line.map do |s|
      NetAddr::CIDR.create(s.chomp)
    end

    alias_method :original_include?, :include?
    def include?(another)
      return original_include?(another) if another.is_a?(Module)

      CIDRList.each do |cidr|
        return true if cidr.matches?(another)
      end

      false
    end
  end
end
