class MailerJob < ApplicationJob
  queue_as :default

  def self.perform
    Letter.templates.each do |letter|
      next unless letter.client_template?

      client_ids = Letter.where("name LIKE ?", "#{letter.name}%").where(template: false).pluck(:client_id)

      Client.where.not(id: client_ids).find_each do |client|
        Rails.logger.info "checking need to send letter for client #{client.id}"

        if Time.now > (client.send(letter.name.to_sym) - 30.days)
          Rails.logger.info "sending letter for client #{client.id}"
          LettersMailer.call(letter, client).deliver
        end
      end
    end
  end
end
