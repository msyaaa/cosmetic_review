require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
    @post = FactoryBot.create(:post, image: fixture_file_upload('public/images/test_image.png'))
  end

  describe "GET #top" do
    it "topアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get top_posts_path
      expect(response.status).to eq 200
    end
    it "topアクションにリクエストするとレスポンスに投稿済みのクチコミの商品名が存在する" do 
      get top_posts_path
      expect(response.body).to include @post.name
    end
    it "topアクションにリクエストするとレスポンスに投稿済みのクチコミの更新日が存在する" do 
      get top_posts_path
      expect(response.body).to include @post.created_at.strftime("%Y.%m.%d")
    end
    it "topアクションにリクエストするとレスポンスに投稿済みのクチコミの投稿者名が存在する" do 
      get top_posts_path
      expect(response.body).to include @post.user.nickname
    end
    it "topアクションにリクエストするとレスポンスに投稿済みのクチコミの評価が存在する" do
      get top_posts_path
      expect(response.body).to include "#{@post.evaluation}"
    end
    it "topアクションにリクエストするとレスポンスに投稿済みのクチコミ商品購入額が存在する" do
      get top_posts_path
      expect(response.body).to include "#{@post.price}"
    end
    it "topアクションにリクエストするとレスポンスに投稿済みのクチコミの画像が存在する" do 
      get top_posts_path
      expect(response.body).to include 'test_image.png'
    end
    it "topアクションにリクエストするとレスポンスに投稿検索フォームが存在する" do 
      get top_posts_path
      expect(response.body).to include '商品名から探す'
    end
    it "topアクションにリクエストするとレスポンスにカテゴリーから探すが存在する" do 
      get top_posts_path
      expect(response.body).to include 'カテゴリーから探す'
    end
    it "topアクションにリクエストするとレスポンスに投稿一覧を見るが存在する" do 
      get top_posts_path
      expect(response.body).to include '投稿一覧を見る'
    end
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get post_path(@post)
      expect(response.status).to eq 200
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクチコミの商品名が存在する" do 
      get post_path(@post)
      expect(response.body).to include @post.name
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクチコミのカテゴリーが存在する" do 
      get post_path(@post)
      expect(response.body).to include @post.category.name
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクチコミの更新日が存在する" do 
      get post_path(@post)
      expect(response.body).to include @post.created_at.strftime("%Y.%m.%d")
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクチコミの投稿者名が存在する" do 
      get post_path(@post)
      expect(response.body).to include @post.user.nickname
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクチコミの評価が存在する" do
      get post_path(@post)
      expect(response.body).to include "#{@post.evaluation}"
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクチコミ商品購入額が存在する" do
      get post_path(@post)
      expect(response.body).to include "#{@post.price}"
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクチコミ商品購入店が存在する" do
      get post_path(@post)
      expect(response.body).to include @post.shop_name
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクチコミレビュー文が存在する" do
      get post_path(@post)
      expect(response.body).to include @post.description
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクチコミの画像が存在する" do 
      get post_path(@post)
      expect(response.body).to include 'test_image.png'
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのクチコミのお気に入り数が存在する" do 
      get post_path(@post)
      expect(response.body).to include "#{@post.likes.count}"
    end
    it "showアクションにリクエストするとレスポンスに関連商品のクチコミ表示部分が存在する" do 
      get post_path(@post)
      expect(response.body).to include '関連商品のクチコミ'
    end
  end 
end
