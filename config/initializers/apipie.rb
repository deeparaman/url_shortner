# encoding: utf-8

Apipie.configure do |config|
  config.app_name                = 'TinyUrlApp'
  config.api_base_url            = '/api'
  config.doc_base_url            = '/tiny_urls_apidoc'
  config.validate                = false
  # config.default_locale          = 'en'
  # where is your API defined?
  config.languages = ['en']
  config.default_locale = 'en'
  config.locale = lambda { |loc| loc ? I18n.locale = loc : I18n.locale }
  config.translate = lambda do |str, loc|
    return '' if str.blank?
    I18n.t str, locale: loc, scope: 'doc'
  end
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
