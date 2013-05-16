# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-hostname"
  gem.version       = "0.0.2"
  gem.authors       = ["Tatsuya Fukata"]
  gem.email         = ["tatsuya.fukata@gmail.com"]
  gem.summary       = %q{Fluentd plugin put the hostname in the data}
  gem.description   = %q{}
  gem.homepage      = "https://github.com/fukata/fluent-plugin-hostname"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "fluentd"
  gem.add_development_dependency "rake"
  gem.add_runtime_dependency "fluentd"
end
