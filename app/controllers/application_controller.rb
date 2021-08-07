class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end
end

#
# rescue_from LocationError::NoLocation, with: :render_not_found_response
# rescue_from LocationError::InvalidLocation, with: :render_bad_request_response
#
# def render_not_found_response(exception)
#   render json: { error: {message: exception.message, code: exception.code} }, status: exception.status
# end
#
# def render_bad_request_response(exception)
#   render json: { error: {message: exception.message, code: exception.code} }, status: exception.status
# end
