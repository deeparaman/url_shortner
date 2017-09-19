# encoding: utf-8

Rails.application.routes.draw do
  apipie
  root 'api/tiny_urls#redirect_to_url'
  namespace :api do
    resource :tiny_url do
      get 'redirect_to_url'
    end
  end
end
