class Letter < ApplicationRecord
  has_paper_trail

  belongs_to :client, optional: true

  scope :templates, ->{ where(template: true) }

  def client_template?
    Client.columns_hash[self.name].type == :date
  rescue
    false
  end
end
