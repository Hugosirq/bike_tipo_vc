# frozen_string_literal: true

require 'spec_helper'

RSpec.shared_examples 'a http method' do
  it 'returns http success' do
    expect(response).to have_http_status(:success)
  end
end

RSpec.shared_examples 'a successful get method' do
  it_behaves_like 'a http method'

  it 'response with JSON body' do
    expect { response.body }.not_to raise_exception
  end
end

RSpec.shared_examples 'a get with jsonapi with default value of' do |model|
  let(:attributes) { data['attributes'].keys }
  let(:model_keys) do
    enums = []
    model.new.attributes.keys.map do |attr|
      if /_cd$/.match?(attr)
        enums << attr
        attr.gsub(/_cd/, '')
      elsif /^id$/.match?(attr)
        nil
      else
        attr
      end
    end.compact + enums
  end

  it 'returns response with default values' do
    expect((model_keys & attributes).size).to eq(model_keys.size)
  end
end

RSpec.shared_examples 'a json api response' do
  let(:body) { JSON.parse(response.body) }
  let(:data) { body['data'].first }

  it { expect(body).to have_key('data') }
  it { expect(data).to have_key('type') }
  it { expect(data).to have_key('id') }
  it { expect(data).to have_key('attributes') }
end

RSpec.shared_examples 'a json api response with all relations of' do |model|
  let(:attributes) { data['relationships'].keys }
  let(:relation_keys) { model.reflections.keys }

  it 'returns response with default relationships' do
    expect(attributes).to match_array(relation_keys)
  end
end
