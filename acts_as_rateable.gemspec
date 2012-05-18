# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = "acts_as_rateable"
  s.version = "0.0.1.alpha"

  s.authors = ["Ferenc Fekete", "Gabriel Gironda", "Michael Reinsch", "Anton Zaytsev", "Denis Savitsky"]
  s.email = ["sadfuzzy@yandex.ru"]
  s.homepage = "http://github.com/sadfuzzy/acts_as_rateable"

  s.summary = %q{Rails plugin providing a rating interface for ActiveRecord models}
  s.description = %q{Acts_as_rateable is a rails plugin providing a rating interface for ActiveRecord models.}

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "supermodel"
end


