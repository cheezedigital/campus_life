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
      context 'when saving a proper record' do
        it 'creates a new note and saves it to the db' do
          expect { #optional arugment, or block and looks at reutrn value to equal something else. if you pass a block and by doing this action something should happen
            post :create, note: {text: 'a new note'}
          }.to change(Note, :count).by(1)
        end
      end
      context 'when the record fails to save' do
        it 'renders the new template and does not save to the db' do
          post :create, note: {text: nil}
          expect(response).to render_template('new')
          expect(Note.count).to eq 0
        end
      end
    end

    describe '#edit' do
      before do
        @note = create(:note)
      end
      it 'displays the note I want to edit' do
        get :edit, id: @note.id
        expect(response).to be_success
        expect(assigns(:note).id).to eq @note.id
        expect(response).to render_template('edit')
      end
    end

    describe '#update' do
      before do
        @note = create(:note, text: "this")
      end
      context 'when the update was successful' do
        it 'updates the text from "this" to "that" and redirects to the notes index page' do
          put :update, id: @note.id, note: {text: "that"}
          expect(@note.reload.text).to eq "that"
          expect(response).to be_redirect
          expect(response).to redirect_to notes_path
        end
      end
      context 'when the update failed' do
        it 'fails to update the text from "this" to nil and renders the edit template' do
          put :update, id: @note.id, note: {text: nil}
          expect(@note.reload.text).to_not be_nil
          expect(response).to render_template("edit")
        end
      end
    end

    describe '#destroy' do
      before do
        @note = create(:note)
      end
      it 'removes the note from the database' do
        expect {
          delete :destroy, id: @note.id
        }.to change(Note, :count).from(1).to(0)
        expect(response).to be_redirect
        expect(response).to redirect_to notes_path
      end
    end

end
