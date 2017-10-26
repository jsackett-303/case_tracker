class IntialAppearanceMailerJob < ApplicationJob
  queue_as :default

  def perform
    letter = Letter.find_by(name: 'initial_appearance')
    clients = Letter.where("name LIKE ?", 'initial_appearance%').where(template: false).pluck(:client_id)

    Client.where.not(id: clients).find_each do |client|
      Rails.logger.info "checking need to send letter for client #{client.id}"
      if Time.now > (client.initial_appearance - 30.days)
        Rails.logger.info "sending letter for client #{client.id}"
        LettersMailer.welcome(letter, client)
      end
    end
  end
end
