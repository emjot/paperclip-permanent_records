# (unreleased)

# 0.8.1 (2024-11-11)

* (internal) Add some metadata for rubygems.org

# 0.8.0 (2024-11-11)

* Add support for ruby 3.3 and rails 7.1
* Drop support for ruby < 3.0 and rails < 6.1
* (dev) Fix: gem should be pushed to rubygems.org
* (dev) Fix github test action to only install the gems based on the current appraisal gemfile
* (dev) dependabot: add github-actions
* (internal) Update some dev dependencies incl. rubocop + config + fix some warnings

# 0.7.1 (2024-04-04)

* (dev) Fix some requires

# 0.7.0 (not released)

* Add support for rails 6.0/6.1/7.0/7.1, ruby 3.0/3.1/3.2
* Drop support for kt-paperclip < 7.2
* Drop support for ruby < 2.7
* (dev) switch to GitHub Actions for CI tests
* (dev) add rake:release task
* (dev) update dev dependencies, fix rubocop config, fix rubocop warnings

# 0.6.0 (2022-09-02)

To upgrade to this version, remove any dependencies to paperclip from your project and switch to kt-paperclip (https://github.com/kreeti/kt-paperclip).

* Change dependency from the discontinued paperclip to kt-paperclip
* Drop support for (kt-)paperclip < 6.2.2
* Drop support for ruby < 2.6
* (dev) remove rake `local` task (unnecessary alias for `wwtd:local`)
* (internal) use current rubocop (1.36) + configs, add rubocop-rake, re-generate todos + fix warnings

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
* Update permanent_records dependency to at least 4.2.7 (currently the latest)
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
