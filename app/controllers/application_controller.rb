# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid,
              with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_object(object, options = {})
    if object.respond_to?(:errors) && object.errors.any?
      render({ jsonapi_errors: object.errors }.merge(options))
    else
      renderization =
        { jsonapi: object, include: includes_params }.merge(options)
      render build_meta_data(object).merge(renderization)
      # render renderization
    end
  end

  def includes_params
    params.fetch(:includes, {})
  end

  def default_includes_params
    model_relationships =
      model_name.reflect_on_all_associations(:has_one).map(&:name)
    model_relationships +=
      model_name.reflect_on_all_associations(:has_many).map(&:name)

    # This line exists to exclude from default_includes_params a relationship
    # with 'versions' (see gem paper_trail)
    model_relationships.delete(:versions)

    params.merge!(includes: model_relationships)
  end

  private

  def model_name
    controller_name.singularize.camelize.constantize
  end

  def build_meta_data(objects)
    if objects.respond_to?(:count)
      { meta: { 'total-count' => objects.count } }
    else
      {}
    end
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
end
