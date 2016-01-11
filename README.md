# Matrack

## Introduction

Matrack is a MVC ruby mini-framework, that is modelled after rails. Matrack takes majority of its inspiration from rails but it is not by any means as complex or robust as rails.

However, matrack is a good fit for simple applications. It makes available some of the great features of rails.


## Version

This is version 0.1.0 of matrack gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "matrack", "0.1.0"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install matrack


## Features
  * Auto genration of necessary directories and files.
  * Helpers.
  * Generation of controllers and corresponding views from commandline line.
  * Generation of models from commandline line.
  * ORM
  * Use of sessions
  * Testing
  * Custom model properties types e.g int, str, time and date.
  * Starting server with the "s" or "server" keyword.

## Limitations
  This version of the gem does not
  * support model relationships.
  * implement callbacks.
  * support migration generation.
  * generate a schema.

## Usage

Usage information can be found [here](https://github.com/andela-oojewale/matrack/wiki/Matrack).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-oojewale/matrack.

* Fork it ( https://github.com/andela-oojewale/matrack/fork)
* Create your feature branch (git checkout -b my-new-feature)
* Commit your changes (git commit -am 'Add some feature')
* Push to the branch (git push origin my-new-feature)
* Create a new Pull Request


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

