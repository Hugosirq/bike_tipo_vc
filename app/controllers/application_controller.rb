# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_object(object)
    if object.respond_to?(:errors) && object.errors.any?
      render(jsonapi_errors: object.errors)
    else
      renderization =
        { jsonapi: object, include: includes_params }
      render renderization
    end
  end

  def includes_params
    params.fetch(:includes, {})
  end
end
