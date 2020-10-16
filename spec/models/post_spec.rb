require 'rails_helper'

RSpec.describe Post, type: :model do
  describe Post do
    before do
      @post = FactoryBot.build(:post)
      @post.image = fixture_file_upload('public/images/test_image.png')
    end

    describe 'レビュー投稿機能' do
      context '投稿がうまくいくとき' do
        it 'name、image、price、description、category_id、evaluationが存在していれば保存できる' do
          expect(@post).to be_valid
        end
        it '購入価格が300~9999999の間であること' do
          @post.price = 11_111
          expect(@post).to be_valid
        end
      end

      context '投稿がうまくいかないとき' do
        it 'nameが空のでは保存できない' do
          @post.name = nil
          @post.valid?
          expect(@post.errors.full_messages).to include('商品名を入力してください')
        end
        it '商品名が50文字以上の時は登録できない' do
          @post.name = Faker::Lorem.characters(50)
          @post.valid?
          expect(@post.errors.full_messages).to include('商品名は50文字以内で入力してください')
        end
        it 'imageが空では保存できない' do
          @post.image = nil
          @post.valid?
          expect(@post.errors.full_messages).to include('画像を選択してください')
        end
        it 'priceが空では保存できない' do
          @post.price = nil
          @post.valid?
          expect(@post.errors.full_messages).to include('購入価格を入力してください')
        end
        it 'priceが0未満であれば保存できない' do
          @post.price = -1
          @post.valid?
          expect(@post.errors.full_messages).to include('購入価格は0以上の値にしてください')
        end
        it 'priceが9999999より大きければ保存できない' do
          @post.price = 10_000_000
          @post.valid?
          expect(@post.errors.full_messages).to include('購入価格は10000000より小さい値にしてください')
        end
        it 'descriptionが空では保存できない' do
          @post.description = nil
          @post.valid?
          expect(@post.errors.full_messages).to include('商品の説明を入力してください')
        end
        it '商品説明が1000文字以上の時は登録できない' do
          @post.description = Faker::Lorem.paragraphs(number: 500)
          @post.valid?
          expect(@post.errors.full_messages).to include('商品の説明は1000文字以内で入力してください')
        end
        it 'category_idが1では保存できない' do
          @post.category_id = 1
          @post.valid?
          expect(@post.errors.full_messages).to include('カテゴリーを選択してください')
        end
        it 'evaluationが空では保存できない' do
          @post.evaluation = ''
          @post.valid?
          expect(@post.errors.full_messages).to include('商品の評価を選択してください')
        end
        it 'shop_nameが50文字以上の時は保存できない' do
          @post.shop_name = Faker::Lorem.characters(50)
          @post.valid?
          expect(@post.errors.full_messages).to include('購入店は50文字以内で入力してください')
        end
      end
    end
  end
end
