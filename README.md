# Paperclip::PermanentRecords

When using permanent_records, paperclip attachments should only be deleted
when the model is really destroyed.

See [paperclip #804](https://github.com/thoughtbot/paperclip/issues/804#issuecomment-4946231).

NOTE: Since paperclip is not maintained any more, we have switched the dependency to the fork [kt-paperclip](https://github.com/kreeti/kt-paperclip) in the 0.6+ versions of this gem.

## Compatibility

* rails 5.2: works with kt-paperclip 6.2.2+/7 and ruby 2.6 or later
* tested with permanent_records 5.0.0
* previous versions of ruby/rails/paperclip: please check version 0.5.x of this gem

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

Ensure that you don't have any dependencies to the paperclip gem in your project, only to the kt-paperclip gem!

## Usage

Nothing to do, this should just work.

## How does it work?

This gem does basically two things:

* prevent paperclip from marking attachments to be deleted in paperclip's `before_destroy` callback(s)
  (by patching paperclip)
* mark attachments to be deleted in the model's `destroy` method
  (depending on whether the model is actually destroyed or only deleted)

## Development

Code style: Please use rubocop before you commit (`bundle exec rubocop`) and fix any warnings.

To setup tests, make sure all the ruby versions defined in `.travis.yml` are installed on your system.
Use `bundle exec appraisal generate` to generate the gemfiles if you change them in `Appraisals` and `.travis.yml`.

Run tests via:

* `rake wwtd` for all combinations of ruby/rails/kt-paperclip versions
* `rake wwtd:local` for all rails/kt-paperclip versions, but only on current ruby
* `rake spec` (or e.g. `bundle exec rspec spec --format documentation`) with main Gemfile and only on current ruby
