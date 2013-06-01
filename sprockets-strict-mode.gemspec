Gem::Specification.new do |s|
  s.name = "sprockets-strict-mode"
  s.version = '1.0'
  s.summary = %(A Sprockets processor that adds "use strict" to your JavaScript files)
  s.homepage = "http://github.com/jsuder/sprockets-strict-mode"

  s.author = "Jakub Suder"
  s.email = "jakub.suder@gmail.com"

  s.files = %w(MIT-LICENSE.txt README.markdown) + Dir['lib/**/*']

  s.add_dependency 'sprockets'
end
