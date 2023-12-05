require 'rails_helper'

RSpec.describe Api::V1::FightersController, type: :controller do

  before{@fighter = Fighter.create(name: 'sektor', description: 'ninja cibernetico')}

  describe 'GET /api/v1/fighters' do
    it 'Consegue listar todos os fighters e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/fighters/id' do
    it 'Consegue listar um fighter especifico e retornar status 200?' do
      get :show, params: {id: @fighter.id}
      expect(response.body).to include_json(id: @fighter.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/fighters' do
    it 'Consegue criar um fighter e retornar status 201?' do
      post :create, params: {fighter: {name: 'shao khan', description: 'super boss'},format: :json}
      expect(response.body).to include_json(name: 'shao khan')
      expect(response).to have_http_status(201)
    end
  end

  describe 'PATCH /api/v1/fighters/id' do
    it 'Consegue atualizar um fighter e retornar status 200?' do
      fighter = Fighter.last
      patch :update, params: {fighter: {name: 'millena', description: 'doidinha'}, id: fighter.id}
      expect(response.body).to include_json(name: 'millena')
      expect(response).to have_http_status(200)
    end
  end

end