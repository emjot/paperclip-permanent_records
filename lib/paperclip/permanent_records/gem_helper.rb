module Paperclip
  module PermanentRecords
    # Like Bundler::GemHelper, but without the 'release' task
    # (would need to be implemented for release on gems.emjot.de)
    class GemHelper < Bundler::GemHelper
      def install
        built_gem_path = nil
        desc "Build #{name}-#{version}.gem into the pkg directory."
        task 'build' do
          built_gem_path = build_gem
        end

        desc "Build and install #{name}-#{version}.gem into system gems."
        task 'install' => 'build' do
          install_gem(built_gem_path)
        end

        GemHelper.instance = self
      end

      def version_tag
        version.to_s
      end
    end
  end
end
