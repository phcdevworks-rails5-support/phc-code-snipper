module Phccodesnipper
  class Script::Url < ApplicationRecord

    # Include Core Validations
    phc_domain_regx = URI::regexp(%w(http https))

    # Relationships
    belongs_to :snippet, class_name: 'Phccodesnipper::Script::Snippet'

    # Form Fields Validation
    validates :script_url,
      presence: true,
      length: { minimum: 5 },
      format: {  :with => phc_domain_regx, message: "Please follow this URL format http or https://www.**********.com" }

  end
end
