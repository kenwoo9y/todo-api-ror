require 'rails_helper'

RSpec.describe "Api::V1::Tasks", type: :request do
  describe "/api/v1/tasks" do
    it "index" do
      FactoryBot.create_list(:task, 10)

      get '/api/v1/tasks'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data'].length).to eq(10)
    end
  end
end
