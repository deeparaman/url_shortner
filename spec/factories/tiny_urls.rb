# encoding: utf-8

FactoryGirl.define do
  factory :tiny_url do
    full_url 'https://www.quora.com/What-happened-to-the-wonderful-RubyMonk-online-Ruby-tutorial'
    shortend_url 'a=%3Fa123d'
  end
end
