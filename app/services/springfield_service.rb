# frozen_string_literal: true

class SpringfieldService < ServiceApplication
  def self.base_url
    ENV['SPRINGFIELD_SERVICE'].to_s
  end

  def self.create_tip(params)
    post(url: '/trips', params: params)
  end
end
