# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Paperclip::PermanentRecords do
  before do
    stub_const('Rails', instance_double('Rails'))
    allow(Rails).to receive(:root).and_return(ROOT.join('tmp'))
    allow(Rails).to receive(:env).and_return('test')
    allow(Rails).to receive(:const_defined?).with(:Railtie).and_return(false)
  end

  let(:test_image_dir) do
    File.expand_path(File.join(File.dirname(__FILE__), '..', 'data'))
  end

  let(:test_image_file) do
    File.new(File.join(test_image_dir, 'test.png'))
  end

  describe '#destroy' do
    context 'on a permanent model with attachments' do
      let!(:model) { PermanentPost.create!(image: test_image_file) }
      let!(:file_path) { model.image.path }

      it 'soft-deletes the model' do
        expect { model.destroy }.to change(model, :deleted?).from(false).to(true)
      end

      it 'keeps the model' do
        expect(model.destroy).not_to be_destroyed
      end

      it "keeps the attachments' files" do
        model.destroy
        expect(model).to be_image
        expect(File).to exist(file_path)

        # should still be okay even after saving again
        model.save!
        expect(model).to be_image
        expect(File).to exist(file_path)
      end

      it "keeps the attachments' files after revive" do
        model.destroy.revive
        expect(model).to be_image
        expect(File).to exist(file_path)

        # should still be okay even after saving again
        model.save!
        expect(model).to be_image
        expect(File).to exist(file_path)
      end

      context 'with :force option' do
        it 'destroys the model' do
          expect(model.destroy(:force)).to be_destroyed
        end

        it "deletes the attachments' files" do
          model.destroy(:force)
          expect(model).not_to be_image
          expect(File).not_to exist(file_path)
        end
      end
    end

    context 'on a permanent model without attachments' do
      let!(:model) { PermanentUid.create!(uid: 99) }

      it 'soft-deletes the model' do
        expect { model.destroy }.to change(model, :deleted?).from(false).to(true)
      end

      it 'keeps the model' do
        expect(model.destroy).not_to be_destroyed
      end

      context 'with :force option' do
        it 'destroys the model' do
          expect(model.destroy(:force)).to be_destroyed
        end
      end
    end

    context 'on a regular model with attachments' do
      let!(:model) { Post.create!(image: test_image_file) }
      let!(:file_path) { model.image.path }

      it 'destroys the model' do
        expect { model.destroy }.to change(Post, :count).from(1).to(0)
      end

      it "deletes the attachments' files" do
        model.destroy
        expect(model).not_to be_image
        expect(File).not_to exist(file_path)
      end
    end

    context 'on a regular model without attachments' do
      let!(:model) { Uid.create!(uid: 99) }

      it 'destroys the model' do
        expect { model.destroy }.to change(Uid, :count).from(1).to(0)
      end
    end
  end
end
