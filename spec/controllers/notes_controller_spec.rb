require 'rails_helper'

RSpec.describe NotesController, :type => :controller do

    describe '#index' do
      before do
        @notes = create_list(:note, 3)
      end
      it 'displays a collection of notes' do
        get :index #this preforms actions
        expect(response).to be_success
        expect(assigns(:notes).count).to eq 3 #return value from instance variable
        expect(response).to render_template('index')#render index
      end
    end

    describe '#show', :focus do
      before do
        @note = create(:note, text: 'my little note')
      end
      it 'displays a single note' do
        get :show, id: @note.id #how we get show action
        expect(response).to be_success
        expect(assigns(:note).text).to eq 'my little note'
        expect(response).to render_template('show')
      end
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
