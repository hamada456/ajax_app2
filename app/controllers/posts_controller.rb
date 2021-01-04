class PostsController < ApplicationController

  def top
  end
  
  def index
    @posts = Post.all.order(id: "DESC") #新しいメモが一番上に表示、DESC（降順）
  end

  def destroy #メモを一つ削除
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def destroy_all #メモを全て削除
    post = Post.all
    post.destroy_all
    redirect_to root_path
  end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
    #メモ作成時に未読の情報を保存するようにした、レスポンスをJSONに変更

    #Post.create(content: params[:content])
    #redirect_to action: :index  #メモを保存した後にトップページへリダイレクト
  end

  def checked#「既読」の操作を行ったときに実行されるアクション
    post = Post.find(params[:id])
    if post.checked 
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end
