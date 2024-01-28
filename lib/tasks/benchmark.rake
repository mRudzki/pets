require 'benchmark'

namespace :benchmark do
  task all: :environment do
    random = rand(1000000)
    random_pet = PetInteger.find(random)
    kind = %w[cat dog rabbit owl].freeze
    Rails.cache.clear

    # byebug
    puts "Count measure:"
    puts "PetInteger.count: #{Benchmark.measure { PetInteger.public_send(random_pet.kind).count} }"
    puts "PetString.count: #{Benchmark.measure { PetString.public_send(random_pet.kind).count} }"
    puts "PetStringIndex.count: #{Benchmark.measure { PetStringIndex.public_send(random_pet.kind).count} }"
    puts "PetIntegerIndex.count: #{Benchmark.measure { PetIntegerIndex.public_send(random_pet.kind).count} }"

    puts "Find by name measure:"
    puts "PetInteger.find_by(name: '#{random_pet.name}'): #{Benchmark.measure { PetInteger.public_send(random_pet.kind).find_by(name: random_pet.name)} }"
    puts "PetString.find_by(name: '#{random_pet.name}'): #{Benchmark.measure { PetString.public_send(random_pet.kind).find_by(name: random_pet.name)} }"
    puts "PetStringIndex.find_by(name: '#{random_pet.name}'): #{Benchmark.measure { PetStringIndex.public_send(random_pet.kind).find_by(name: random_pet.name)} }"
    puts "PetIntegerIndex.find_by(name: '#{random_pet.name}'): #{Benchmark.measure { PetIntegerIndex.public_send(random_pet.kind).find_by(name: random_pet.name)} }"

    puts "Find by id measure:"
    puts "PetInteger.find(#{random}): #{Benchmark.measure { PetInteger.public_send(random_pet.kind).find(random)} }"
    puts "PetString.find(#{random}): #{Benchmark.measure { PetString.public_send(random_pet.kind).find(random)} }"
    puts "PetStringIndex.find(#{random}): #{Benchmark.measure { PetStringIndex.public_send(random_pet.kind).find(random)} }"
    puts "PetIntegerIndex.find(#{random}): #{Benchmark.measure { PetIntegerIndex.public_send(random_pet.kind).find(random)} }"
  end
end
