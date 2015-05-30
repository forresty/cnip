# CNIP

test if an IP belongs to mainland China

`chnroutes.txt` originally from [https://github.com/clowwindy/ChinaDNS](https://github.com/clowwindy/ChinaDNS)

[![Code Climate](https://codeclimate.com/github/forresty/cnip/badges/gpa.svg)](https://codeclimate.com/github/forresty/cnip)
[![Build Status](https://travis-ci.org/forresty/cnip.svg?branch=master)](https://travis-ci.org/forresty/cnip)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cnip'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cnip

## Usage

```ruby
CNIP.include?('1.0.1.0')
# => true

CNIP.include?('8.8.8.8')
# => false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/forresty/cnip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
