class Letter < ApplicationRecord
  has_paper_trail

  belongs_to :client, optional: true
end
