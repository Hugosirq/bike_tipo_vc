# frozen_string_literal: true

class ServiceApplication
  def self.post(url, params = nil, headers = nil)
    return nil unless url
    RestClient.post(url, params, headers: headers)
  end

end
