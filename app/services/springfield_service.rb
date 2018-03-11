# frozen_string_literal: true

class SpringfieldService < ServiceApplication
  def self.base_url
    ENV['SPRINGFIELD_SERVICE'].to_s
  end

  def self.header
    { Authorization: ENV['SPRINGFIELD_SERVICE_ACCESS_TOKEN'].to_s }
  end

  def self.create_trip(params)
    post('/trips', params)
  end

end
