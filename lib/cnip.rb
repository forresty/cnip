require "cnip/version"

require "netaddr"

module CNIP
  class << self
    CIDRList = File.read(File.expand_path('../../data/chnroute.txt', __FILE__)).each_line.map do |s|
      NetAddr::CIDR.create(s.chomp)
    end

    alias_method :original_include?, :include?
    def include?(ip_or_module)
      return original_include?(ip_or_module) if ip_or_module.is_a?(Module)

      CIDRList.each do |cidr|
        return true if cidr.matches?(ip_or_module)
      end

      false
    end
  end
end
