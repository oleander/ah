# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :partner
  belongs_to :material
end
