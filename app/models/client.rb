require 'csv'

class Client < ApplicationRecord
  include SearchCop
  has_paper_trail

  search_scope :search do
    attributes :case_id, :last_name, :first_name, :address, :city, :state, :notes
  end

  def self.import_csv(file)
    return if file.blank?
    csv_text = File.read(file.tempfile)
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      Client.create!(row.to_hash)
    end
  end
end
