source "https://rubygems.org"

ruby ">= 3.2.0"

gem "rails", "8.1.3.1"
gem "json", "< 3.0"
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "dartsass-rails"
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
end

group :development do
  gem "web-console"
end

gem "tzinfo-data", platforms: %i[windows jruby]
