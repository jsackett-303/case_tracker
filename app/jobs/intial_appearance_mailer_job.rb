class IntialAppearanceMailerJob < ApplicationJob
  queue_as :default

  def perform
    letter = Letter.where(template: true, name: 'initial_appearance').first
    clients = Letter.where("name LIKE ?", 'initial_appearance%').where(template: false).pluck(:client_id)

    Client.where.not(id: clients).find_each do |client|
      Rails.logger.info "checking need to send letter for client #{client.id}"

      if Time.now > (client.initial_appearance - 30.days)
        Rails.logger.info "sending letter for client #{client.id}"
        LettersMailer.initial_appearance(letter, client).deliver
      end
    end
  end
end
