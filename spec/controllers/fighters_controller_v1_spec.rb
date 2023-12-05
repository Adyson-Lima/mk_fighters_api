require 'rails_helper'

RSpec.describe Api::V1::FightersController, type: :controller do

  before{@fighter = Fighter.create(name: 'sektor', description: 'ninja cibernetico')}

  describe 'GET /api/v1/mk_fighters' do
    it 'Consegue listar todos os fighters e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/mk_fighters/id' do
    it 'Consegue listar um fighter especifico e retornar status 200?' do
      get :show, params: {id: @fighter.id}
      expect(response.body).to include_json(id: @fighter.id)
      expect(response).to have_http_status(200)
    end
  end

end