# Paperclip::PermanentRecords

When using permanent_records, paperclip attachments should only be deleted
when the model is really destroyed.

See [paperclip #804](https://github.com/thoughtbot/paperclip/issues/804#issuecomment-4946231).

NOTE: Since paperclip is not maintained any more, we have switched the dependency to the fork [kt-paperclip](https://github.com/kreeti/kt-paperclip) in the 0.6+ versions of this gem.

## Compatibility

* rails 5.2: works with kt-paperclip 7 and ruby ~> 2.7
* rails 6.0/6.1: works with kt-paperclip ~> 7.2 and ruby 2.7.8 or later
* rails 7.0/7.1: works with kt-paperclip ~> 7.2 and ruby 3.0.6 or later
* tested with permanent_records 6.0.0
* previous versions of ruby/rails/paperclip: please check version 0.6.x of this gem

Please see `.github/workflows/lint_and_test.yml` and `Appraisals` for what combinations have actually been tested. Usage with other versions
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

Use `bundle exec appraisal generate` to generate the gemfiles if you change them in `Appraisals` and `.github/workflows/lint_and_test.yml`.

### Running tests

To setup tests, make sure all the ruby versions defined in `.github/workflows/lint_and_test.yml` are installed on your system.

Assuming you are using [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/), run tests with each of the supported ruby versions:

```
RBENV_VERSION=2.7.8 bundle exec appraisal rspec
```

## Install and release

To install this gem onto your local machine, run `bundle exec rake install`.

For the following, replace `user:pass` with the HTTP Basic Auth credentials for the gem server ([gems.emjot.de](https://gems.emjot.de)).

* Prepare:
  * update `CHANGELOG.md` documentation
  * update the version number in `lib/paperclip/permanent_records/version.rb`
* Release
  * run `RUBYGEMS_USERINFO=user:pass bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to the gem server
