# frozen_string_literal: true

appraise 'rails_7.1' do
  gem 'rails', '~> 7.1.0'
end

appraise 'rails_7.2' do
  gem 'rails', '~> 7.2.0'
end

appraise 'rails_8.0' do
  gem 'rails', '~> 8.0.0'
end

appraise 'rails_8.1' do
  gem 'rails', '~> 8.1.0'
end

# Smoke-tests the gemspec's kt-paperclip '>= 7.2' floor, which the appraisals
# above never exercise since they all resolve the latest allowed kt-paperclip.
appraise 'rails_7.1-kt_paperclip_7.2' do
  gem 'rails', '~> 7.1.0'
  gem 'kt-paperclip', '~> 7.2.0'
end

# Smoke-tests permanent_records 7.0.0, which is tagged upstream but not yet published to
# rubygems.org (https://github.com/JackDanger/permanent_records/issues/116), so the appraisals
# above (which resolve via rubygems) never exercise it.
appraise 'rails_8.1-permanent_records_7.0' do
  gem 'rails', '~> 8.1.0'
  gem 'permanent_records', git: 'https://github.com/JackDanger/permanent_records.git', tag: '7.0.0'
end
