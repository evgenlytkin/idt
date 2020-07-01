# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sitemap, only: [:index], path: "sitemap"
    end
  end

  resources :home, only: [:index], path: "home"
end
