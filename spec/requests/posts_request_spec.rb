require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before do
    @user = FactoryBot.create(:user)
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
end
