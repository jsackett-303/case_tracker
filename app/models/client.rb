require 'csv'

class Client < ApplicationRecord
  has_paper_trail

  def self.import_csv(file)
    csv_text = File.read(file.tempfile)
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      Client.create!(row.to_hash)
    end
  end
end
