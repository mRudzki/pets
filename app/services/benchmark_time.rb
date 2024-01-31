require 'benchmark'

class BenchmarkTime
  NUM_OF_TRIES = 1000.freeze
  def initialize
    @random_pet = PetInteger.find(rand(1000000))
    Rails.cache.clear
  end

  def call
    # ActiveRecord::Base.logger = Logger.new(STDOUT)
    count_times
    find_by_name_times
    find_by_id_times
    where_name_times
  end

  attr_reader :random_pet

  def count_times
    puts "Count measure:"
    get_time("PetInteger", "count")
    get_time("PetString", "count")
    get_time("PetStringIndex", "count")
    get_time("PetIntegerIndex", "count")
  end

  def find_by_name_times
    puts "Find by name measure:"
    get_time("PetInteger", "find_by_name", random_pet.name)
    get_time("PetString", "find_by_name", random_pet.name)
    get_time("PetStringIndex", "find_by_name", random_pet.name)
    get_time("PetIntegerIndex", "find_by_name", random_pet.name)
  end

  def find_by_id_times
    puts "Find by id measure:"
    get_time("PetInteger", "find_by_id", random_pet.id)
    get_time("PetString", "find_by_id", random_pet.id)
    get_time("PetStringIndex", "find_by_id", random_pet.id)
    get_time("PetIntegerIndex", "find_by_id", random_pet.id)
  end

  def where_name_times
    puts "Where name measure:"
    get_time_where("PetInteger")
    get_time_where("PetString")
    get_time_where("PetStringIndex")
    get_time_where("PetIntegerIndex")
  end


  def get_time(klass_name, method_name, args = nil)
    time = 0
    NUM_OF_TRIES.times do
      time += Benchmark.realtime { klass_name.safe_constantize.public_send(random_pet.kind).public_send(method_name, args) }
      Rails.cache.clear
    end

    puts "#{klass_name}.#{method_name}#{args ? "(#{args})" : ""}: #{time/NUM_OF_TRIES * 1000}"
  end

  def get_time_where(klass_name)
    time = 0
    NUM_OF_TRIES.times do
      time += Benchmark.realtime do
        variable = klass_name.safe_constantize.public_send(random_pet.kind).where(name: random_pet.name).load
      end
      Rails.cache.clear
    end

    puts "#{klass_name}.where(name: #{random_pet.name}): #{time/NUM_OF_TRIES * 1000}"
  end
end
