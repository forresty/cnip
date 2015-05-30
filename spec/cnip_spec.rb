require 'spec_helper'

module FooModule; end
module BarModule; end

module CNIP
  include FooModule
end

describe CNIP do
  it 'has a version number' do
    expect(CNIP::VERSION).not_to be nil
  end

  describe 'class methods' do
    subject { CNIP }

    it { is_expected.to respond_to :include? }

    describe 'include?' do
      it 'overrides .include? to provide IP test' do
        expect(subject.include?('1.0.1.0')).to eq(true)
        expect(subject.include?('8.8.8.8')).to eq(false)
      end

      it 'still conforms to default include? semantics' do
        expect(subject.include?(FooModule)).to eq(true)
        expect(subject.include?(BarModule)).to eq(false)
      end
    end
  end
end
