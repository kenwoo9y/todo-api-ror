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

    it "show" do
      task = create(:task, name: 'test-task', description: 'test-description', status: 'open')

      get "/api/v1/tasks/#{task.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['name']).to eq(task.name)
      expect(json['data']['description']).to eq(task.description)
      expect(json['data']['status']).to eq(task.status)
    end

    it "create" do
      valid_params = { name: 'test-task', description: 'test-description', status: 'open' }

      expect { post "/api/v1/tasks", params: { task: valid_params } }.to change(Task, :count).by(+1)
      expect(response.status).to eq(200)
    end

    it "update" do
      task = create(:task, name: 'test-task', description: 'test-description', status: 'open')

      put "/api/v1/tasks/#{task.id}", params: { task: { name: 'new-name' }  }
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['name']).to eq('new-name')
    end

    it "destroy" do
      task = create(:task)

      expect { delete "/api/v1/tasks/#{task.id}" }.to change(Task, :count).by(-1)
      expect(response.status).to eq(200)
    end
  end
end
