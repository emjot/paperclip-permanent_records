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
