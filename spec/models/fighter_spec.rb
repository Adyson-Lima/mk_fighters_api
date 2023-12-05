require 'rails_helper'

RSpec.describe Fighter, type: :model do

  before{@fighter = Fighter.new}

  describe 'Testes de preenchimento do model Fighter' do

    it 'name consegue ser preenchido?' do
      @fighter.name = 'kabal'
      expect(@fighter.name).to eq('kabal')
    end

  end

end