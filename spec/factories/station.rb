# frozen_string_literal: true

FactoryBot.define do
  factory :station do
    description 'Estação Youse'
    address 'Av. Brg. Faria Lima, 4285'
    neighborhood 'Itaim Bibi'
    max_capacity 100
  end
end
