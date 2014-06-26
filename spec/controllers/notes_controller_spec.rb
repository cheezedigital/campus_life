require 'rails_helper'

RSpec.describe NotesController, :type => :controller do

    describe '#index' do
      before do
        @notes = create_list(:note, 3)
      end
      it 'displays a collection of notes' do
        get :index 
      end
    end

    describe '#show' do

    end

    describe '#new' do

    end

    describe '#create' do

    end

    describe '#edit' do

    end

    describe '#update' do

    end

    describe '#destroy' do

    end

end
