module Phccodesnipper
  class Script::Url < ApplicationRecord

    # Relationships
    belongs_to :snippet, class_name: 'Phccodesnipper::Script::Snippet'

  end
end
