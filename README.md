# Paperclip::PermanentRecords

When using permanent_records, paperclip attachments should only be deleted
when the model is really destroyed.

See [paperclip #804](https://github.com/thoughtbot/paperclip/issues/804#issuecomment-4946231).

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

## Testing

To setup tests, make sure all the ruby versions defined in `.travis.yml` are installed on your system.

Run tests via:

* `rake wwtd` for all combinations of ruby/rails versions
* `rake wwtd:local` for all rails versions, but only on current ruby
* `rake spec` (or e.g. `bundle exec rspec spec --format documentation`) with main Gemfile and only on current ruby
