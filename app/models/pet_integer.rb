class PetInteger < ApplicationRecord
  enum kind: {cat: 0, dog: 1, rabbit: 2, owl: 3}
end
