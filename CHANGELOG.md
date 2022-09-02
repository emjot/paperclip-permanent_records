# (unreleased)

* Change dependency from paperclip to maintained fork kt-paperclip (https://github.com/kreeti/kt-paperclip)
* Drop support for (kt-)paperclip < 6.2.2
* Drop support for ruby < 2.6
* Remove rake `local` task (unnecessary alias for `wwtd:local`)
* (internal) use current rubocop (1.36) + configs, re-generate todos + fix warnings

# 0.5.0 (2021-08-12)

* Drop support for rails < 5.2
* Drop support for ruby < 2.5
* Test with rails 5.2
* Test on ruby 2.6 and 2.7
* Update permanent_records to at least 5.0.0 (currently the latest)
* paperclip: drop support for < 6.0, test 6.0 and 6.1
* Update dev dependencies (+ some code style fixes), incl. bundler to 2.x
  (UPGRADING: you might need to remove your local Gemfile.lock and check that you have bundler 2.x
  installed in all the rubies referenced in .travis.yml)

# 0.4.0 (2018-01-18)

* Remove support for rails < 4.2
* Remove support for ruby 2.1
* Test with rails 5.0 and 5.1
* Test on ruby 2.4 and 2.5
* Update permanent_records dependency to at least 4.2.7 (currenly the latest)
* paperclip: update patch to its 5.1.0 counterpart, test with 5.0 and 5.1
* Don't trigger ActiveRecord loading on requiring this gem
* Dev dependencies: update rake and rubocop/rubocop-rspec (+ some code style fixes)

# 0.3.0 (2018-01-17)

* Remove support for rails < 4.0 and paperclip < 4.1
* Remove support for ruby 1.9 and 2.0
* Test on ruby 2.1 and 2.3
* Test with paperclip 4.2
* Dev dependencies: update versions, add rubocop (+ lots of code style fixes), fix definitions

# 0.2.0 (2015-03-11)

* Update permanent_records dependency from 3.2 to 3.3

# 0.1.0 (2015-02-12)

Initial version.
