require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "/api/v1/users" do
    it "index" do
      FactoryBot.create_list(:user, 10)

      get '/api/v1/users'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data'].length).to eq(10)
    end

    it "show" do
      user = create(:user, user_name: 'test-user', email: 'test-user@example.com', last_name: 'foo', first_name: 'bar', password: 'password')

      get "/api/v1/users/#{user.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['user_name']).to eq(user.user_name)
      expect(json['data']['email']).to eq(user.email)
      expect(json['data']['last_name']).to eq(user.last_name)
      expect(json['data']['first_name']).to eq(user.first_name)
    end

    it "create" do
      valid_params = { user_name: 'test-user', email: 'test-user@example.com', last_name: 'foo', first_name: 'bar', password: 'password' }

      expect { post "/api/v1/users", params: { user: valid_params } }.to change(User, :count).by(+1)
      expect(response.status).to eq(200)
    end

    it "update" do
      user = create(:user, user_name: 'test-user', email: 'test-user@example.com', last_name: 'foo', first_name: 'bar', password: 'password')

      put "/api/v1/users/#{user.id}", params: { user: { user_name: 'new-name' }  }
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['user_name']).to eq('new-name')
    end

    it "destroy" do
      user = create(:user)

      expect { delete "/api/v1/users/#{user.id}" }.to change(User, :count).by(-1)
      expect(response.status).to eq(200)
    end
  end


end
