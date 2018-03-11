# frozen_string_literal: true

class ServiceApplication
  def base_url; end

  def header; end

  def self.post(url, params = nil)
    return nil unless url
    RestClient.post(
      "#{base_url}#{url}",
      params.to_json,
      header.merge(content_type: :json)
    )
  end
end
