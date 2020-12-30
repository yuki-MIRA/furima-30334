require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿がうまくいく時' do
      it 'textが存在すれば登録できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿がうまくいかない時' do
      it 'textが空だと投稿できない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
