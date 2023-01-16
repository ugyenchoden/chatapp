# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::UsersResolver do
  let_it_be(:profile_a) do
    { firstname: 'Jeon', lastname: 'Jungkook' }
  end

  let_it_be(:profile_b) do
    { firstname: 'Jeff', lastname: 'Satur' }
  end

  let_it_be(:key_admin) { create(:user, :key_admin, profile_attributes: profile_b) }
  let_it_be(:user) { create(:user, :user, :inactive, profile_attributes: profile_c) }

  describe '.resolve' do
    context 'without filters' do
      it 'returns all users' do
        users, errors = paginated_collection(:users, query, current_user: key_admin)
        expect(errors).to be_nil
        expect(users.pluck(:id)).to eq([key_admin.id, user.id])
      end
    end

    context 'with role filters' do
      it 'returns users matching the given roles' do
        users, errors = paginated_collection(:users, query(role_ids: role_ids(['user'])), current_user: user)
        expect(errors).to be_nil
        expect(users.pluck(:id)).to match_array([user.id])
      end
    end

    context 'with search resolvers' do
      it 'returns users matching query' do
        users, errors = paginated_collection(:users, query(query: 'jungkook'), current_user: user)
        expect(errors).to be_nil
        expect(users.pluck(:id)).to match_array([key_admin.id])
      end
    end
  end

  def query(args = {})
    connection_query("users#{query_string(args)}", 'id email name roleName')
  end
end
