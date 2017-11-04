class Letter < ApplicationRecord
  has_paper_trail

  belongs_to :client, optional: true

  scope :templates, ->{ where(template: true) }
end
