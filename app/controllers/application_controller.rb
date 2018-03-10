# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :set_paper_trail_whodunnit
  rescue_from ActiveRecord::RecordInvalid,
              with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_with(json)
    return json_paginate(json) if json.is_a?(ActiveRecord::Relation)
    render jsonapi: json, include: includes_params,
           content_type: 'application/vnd.api+json; charset=utf-8'
  end

  def json_paginate(json)
    json = json.paginate(page: params[:page], per_page: params[:per_page])
    render_object(json, links: pagination(json), meta: pagination_meta(json))
  end

  def render_with_errors(json)
    render json: json, status: :unprocessable_entity
  end

  def includes_params
    params.as_json.fetch('includes', {})
  end

  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    response = {
      errors: [{
        title: exception.message,
        source: exception.backtrace[0],
        details: ''
      }]
    }

    render json: response, status: :not_found
  end

  def current_user
    @current_user ||= :me
  end
end
