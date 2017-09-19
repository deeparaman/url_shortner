# encoding: utf-8

# Class for handling api for common actions
class ApiController < ActionController::Base
  respond_to :json

  ##
  # Adding param_missing excception
  rescue_from Apipie::ParamMissing do |exception|
    render status: 400, json: {
      param: exception.param,
      error: exception.to_s
    }
  end
  ##
  # Adding param_invalid excception
  rescue_from Apipie::ParamInvalid do |exception|
    render status: 400, json: {
      param: exception.param,
      error: exception.to_s
    }
  end
end
