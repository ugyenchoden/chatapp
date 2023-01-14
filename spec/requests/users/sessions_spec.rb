# frozen_string_literal: true

require 'swagger_helper'

describe 'Sessions API' do
  let_it_be(:user) { create(:user, :user, password: 'Test123') }

  path '/api/v1/users/sign_in' do
    post 'Creates a session for a user' do
      tags 'Session'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[email password]
          }
        }
      }

      response '200', 'user logged in' do
        let_it_be(:params) do
          {
            user: {
              email: user.email,
              password: 'Test123'
            }
          }
        end
        run_test! do
          expect(json).to have_attributes(email: user.email)
        end
      end
    end
  end
end
