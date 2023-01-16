# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope 'api/v1', defaults: { format: :json } do
    devise_for(
      :users,
      module: :devise,
      controllers: {
        sessions: 'api/v1/sessions', only: :create,
        registrations: 'api/v1/registrations'
      }
    )
  end

  namespace :api do
    namespace :v1 do
      post '/graphql', to: 'graphql#execute'
    end
  end
end
