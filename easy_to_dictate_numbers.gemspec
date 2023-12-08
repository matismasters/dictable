# frozen_string_literal: true

require_relative 'lib/easy_to_dictate_numbers/version'
require_relative 'lib/easy_to_dictate_numbers/extend_primitives'

Gem::Specification.new do |spec|
  spec.name = 'easy_to_dictate_numbers'
  spec.version = EasyToDictateNumbers::VERSION
  spec.authors = ['Matias Verges']
  spec.email = ['matismasters@gmail.com']

  spec.summary = 'Transform numbers into words to dictate them easily.'
  spec.description = 'Transform numbers into words to dictate them easily.' \
    "For example 1234 becomes twelve thirty four and 123456 becomes 'one two three, four five six'"
  spec.homepage = 'https://github.com/matismasters/easy_to_dictate_numbers'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/matismasters/easy_to_dictate_numbers'
  spec.metadata['changelog_uri'] = 'https://github.com/matismasters/easy_to_dictate_numbers/blob/main/CHANGELOG.md'
  spec.license = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
