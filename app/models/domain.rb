class Domain < ApplicationRecord
    has_one :price ,  dependent: :destroy 

    accepts_nested_attributes_for :price, allow_destroy: true
end
