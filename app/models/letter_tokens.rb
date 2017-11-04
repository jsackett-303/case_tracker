class LetterTokens
  OVERRIDES = {
    'CLIENT_INITIAL_APPEARANCE' => '<%= @client.initial_appearance.to_s(:long) %>',
  }

  UTIL_TOKENS = {
    'DATE_TODAY' => '<%= Date.today.to_s(:long) %>'
  }

  def self.client_map
    Client.new.attributes.keys.sort.inject({}) do |hash,k|
     hash["CLIENT_#{k.upcase}"] = "<%= @client.#{k} %>"
     hash
    end
  end

  def self.client_tokens
    client_map.merge(OVERRIDES)
  end

  def self.all
    UTIL_TOKENS.merge(client_tokens)
  end
end
