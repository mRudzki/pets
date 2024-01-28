require 'benchmark'

namespace :benchmark do
  task all: :environment do
    BenchmarkTime.new.call
  end
end
