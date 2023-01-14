# frozen_string_literal: true

require 'swagger_helper'

describe 'Sign Out API' do
  let_it_be(:user) { create(:user, :user, password: 'Test123') }

  path '/api/v1/users/sign_out' do
    delete 'Signs out user' do
      tags 'Logout'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: []]

      before { sign_in(user) }

      response '204', 'user signed out' do
        run_test!
      end
    end
  end
end
