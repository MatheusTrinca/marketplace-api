# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

# LIVE 4 22:40
# https://www.youtube.com/watch?v=r_zb4aCpWu8&list=PLkjb8D53F2ilcHtYTekiLCt-RDNUSg6XV&index=5&ab_channel=skilldevs