# frozen_string_literal: true

module Paperclip
  module PermanentRecords
    # Patches Bundler::GemHelper to allow setting HTTP Basic Auth credentials for the
    # "allowed_push_host" defined in the gemspec via "RUBYGEMS_USERINFO" environment variable.
    #
    # This enables e.g. "RUBYGEMS_USERINFO=myuser:my_password bundle exec rake release" when
    # you have a private gem server like "https://gems.emjot.de" defined as "allowed_push_host".
    #
    # Also, version tagging is done without the "v" Prefix, just the plain version
    # (also ignores any GemHelper.tag_prefix if you would set it!).
    #
    # Based on bundler v2.4.22
    module GemHelper
      protected

      def allowed_push_host
        url = @gemspec.metadata['allowed_push_host'] if @gemspec.respond_to?(:metadata)
        env_userinfo = ENV.fetch('RUBYGEMS_USERINFO', nil)
        env_userinfo = nil if env_userinfo && env_userinfo.empty?

        return url unless url && env_userinfo

        uri = URI.parse(url)
        uri.userinfo = env_userinfo
        uri.to_s
      end

      def version_tag
        version.to_s
      end
    end
  end
end
