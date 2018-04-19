# encoding: utf-8

# Class represents TinyUrl
class TinyUrl < ActiveRecord::Base
  ##
  # Validation
  validates :full_url, :shortend_url, presence: true
  ##
  # Json Response
  FIELDS_RENDERED = %i[id full_url shortend_url].freeze
  METHODS_RENDERED = [].freeze
  def as_json
    super(
      methods: TinyUrl::METHODS_RENDERED,
      only: TinyUrl::FIELDS_RENDERED
      )
  end

  ##
  # Method for geting full url if exist in database
  def self.find_or_initialize(url)
    TinyUrl.find_or_initialize_by(full_url: url, shortend_url: generate_tiny_url(url))
  end

  ##
  # Method for generating tiny_url from full_url
  def self.generate_tiny_url(tiny_url)
    Digest::MD5.hexdigest(tiny_url).slice(0..6)
  end
end
