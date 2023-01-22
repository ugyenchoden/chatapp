# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::UserResolver do
  let_it_be(:user_a) { create(:user, :user) }
  let_it_be(:user_b) { create(:user, :user) }

  describe '.resolve' do
    context 'without id' do
      it 'returns current user details' do
        user, errors = formatted_response(query, current_user: user_b, key: :user)
        expect(errors).to be_nil
        expect(user).to have_attributes(
          email: user_b.email,
          id: user_b.id,
          name: user_b.name
        )
      end
    end

    context 'with id' do
      it 'returns details of the given user' do
        user, errors = formatted_response(query(id: user_a.id), current_user: user_b, key: :user)
        expect(errors).to be_nil
        expect(user).to have_attributes(
          email: user_a.email,
          id: user_a.id,
          name: user_a.name
        )
      end
    end

    context "when record doesn't exist" do
      it 'responds with error' do
        data, errors = formatted_response(
          query(id: '16c85b18-473d-4f5d-9ab4-666c7faceb6c\"'), current_user: user_b
        )

        expect(data.user).to be_nil
        expect(errors[0]).to include("Couldn't find User with 'id'=16c85b18-473d-4f5d-9ab4-666c7faceb6c\"")
      end
    end
  end

  def query(args = {})
    <<~GQL
      query {
        user#{query_string(args)} {
          id
          email
          name
          profile { firstname lastname }
        }
      }
    GQL
  end
end
