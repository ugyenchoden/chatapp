# frozen_string_literal: true

require 'swagger_helper'

describe 'Registrations API' do
  let_it_be(:role) { create(:role, :user) }

  path '/api/v1/users' do
    post 'Creates a user' do
      tags 'Registration'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
              role_id: { type: :integer, default: 0 },
              profile_attributes: {
                type: :object,
                properties: {
                  firstname: { type: :string },
                  lastname: { type: :string }
                },
                required: %w[firstname lastname]
              }
            },
            required: %w[email role_id password]
          }
        }
      }

      response '200', 'user created' do
        let_it_be(:params) do
          {
            user: {
              email: 'u.c@selise.ch',
              password: 'Test123',
              role_id: role.id,
              profile_attributes: {
                firstname: 'Ugyen',
                lastname: 'Choden'
              }
            }
          }
        end
        run_test! do
          expect(json).to have_attributes(email: 'u.c@selise.ch')
        end
      end

      response '422', 'unprocessable entity' do
        let_it_be(:params) { { user: { role_id: role.id } } }

        run_test! do
          expect(json.errors).to match_array(
            [
              "Email can't be blank",
              "Profile can't be blank",
              "Password can't be blank"
            ]
          )
        end
      end
    end
  end
end
