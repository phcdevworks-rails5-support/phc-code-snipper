module Phccodesnipper
  class Script::Snippet < ApplicationRecord
  
    # Include Core Validations
    include Phccorehelpers::Validations
  
    # Clean URL Initialize
    extend FriendlyId
    
    # Relationships
    has_many :urls, class_name: 'Phccodesnipper::Script::Url'
    
    # Form Fields Validation 
    validates :snippet_tittle,
      presence: true,
      length: { minimum: 2 }

    validates :snippet_code,
      presence: true,
      length: { minimum: 2 }

    # Clean URL Define
    friendly_id :phc_nice_url_slug, use: [:slugged, :finders]

    # Define for Multiple Records
    def phc_nice_url_slug
      [
        [:snippet_tittle]
      ]
    end

  end
end
