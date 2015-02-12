# Paperclip::PermanentRecords

When using permanent_records, paperclip attachments should only be deleted
when the model is really destroyed.

See [paperclip #804](https://github.com/thoughtbot/paperclip/issues/804#issuecomment-4946231).

## Compatibility

Sensible combinations of: paperclip 3.4 - 4.1, rails 3.2 - 4.2, ruby 1.9.3 - 2.2.

Please see `.travis.yml` and `Appraisals` for what combinations have actually been tested. Usage with other versions
might cause data loss.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paperclip-permanent_records'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip-permanent_records

## Usage

Nothing to do, this should just work.

## How does it work?

This gem does basically two things:

* prevent paperclip from marking attachments to be deleted in paperclip's `before_destroy` callback(s)
  (by patching paperclip)
* mark attachments to be deleted in the model's `destroy` method
  (depending on whether the model is actually destroyed or only deleted)

## Testing

To setup tests, make sure all the ruby versions defined in `.travis.yml` are installed on your system.

Run tests via:

* `rake wwtd` for all combinations of ruby/rails/paperclip versions
* `rake wwtd:local` for all rails/paperclip versions, but only on current ruby
* `rake spec` (or e.g. `bundle exec rspec spec --format documentation`) with main Gemfile and only on current ruby
