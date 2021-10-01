require 'rails_helper'

RSpec.describe Map, type: :model do
  before do
    @map = FactoryBot.build(:map)
  end
  describe '公園情報投稿' do
    context '登録できる時' do
      it '全てのカラムを正常入力したら登録できる' do
        expect(@map).to be_valid
      end
    end
  end
    context '登録できない時' do
      it '公園名が空だったら登録できない' do
        @map.name = ''
        @map.valid?
        expect(@map.errors.full_messages).to include "Name can't be blank"
      end
      it '住所が空だったら登録できない' do
        @map.address = ''
        @map.valid?
        expect(@map.errors.full_messages).to include "Address can't be blank"
      end
      it 'メッセージが空だったら登録できない' do
        @map.message = ''
        @map.valid?
        expect(@map.errors.full_messages).to include "Message can't be blank"
      end
    end
end
