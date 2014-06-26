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

    describe '#show' do
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
      it 'sets up a new note instance' do
        get :new
        expect(response).to be_success
        expect(assigns(:note)).to be_new_record
        expect(response).to render_template('new')
      end
    end

    describe '#create' do #don't render template coz we don't have a create.html.erb. ever.
      context 'when saving a proper record', :focus do
        it 'creates a new note and saves it to the db' do
          expect { #optional arugment, or block and looks at reutrn value to equal something else. if you pass a block and by doing this action something should happen
            post :create, note: {text: 'a new note'}
          }.to change(Note, :count).by(1)
        end
      end
      context 'when the record fails to save' do
        
      end
    end

    describe '#edit' do

    end

    describe '#update' do

    end

    describe '#destroy' do

    end

end
