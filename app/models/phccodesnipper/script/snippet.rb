module Phccodesnipper
  class Script::Snippet < ApplicationRecord
  
    # Relationships
    has_many :urls, class_name: 'Phccodesnipper::Script::Url'

  end
end
