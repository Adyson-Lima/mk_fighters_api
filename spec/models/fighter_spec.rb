require 'rails_helper'

RSpec.describe Fighter, type: :model do

  before{@fighter = Fighter.new}

  describe 'Testes de preenchimento do model Fighter' do

    it 'name consegue ser preenchido?' do
      @fighter.name = 'kabal'
      expect(@fighter.name).to eq('kabal')
    end

    it 'description consegue ser preenchido?' do
      @fighter.description = 'o melhor'
      expect(@fighter.description).to eq('o melhor')
    end

  end

  describe 'Testes de validação do model Fighter' do

    it 'fighter valido com campos obrigatorios preenchidos?' do
      @fighter.name = 'cyrax'
      @fighter.description = 'ninja cibernetico'
      expect(@fighter).to be_valid
    end

    it 'fighter invalido com campos obrigatorios não preenchidos?' do
      fighter = Fighter.new
      expect(fighter).to be_invalid
    end

  end

end