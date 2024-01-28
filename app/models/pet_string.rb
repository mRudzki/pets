class PetString < ApplicationRecord
  kind = %w[cat dog rabbit owl].freeze

  enum kind: kind.zip(kind).to_h
end
