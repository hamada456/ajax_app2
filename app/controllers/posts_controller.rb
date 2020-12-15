class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC") #新しいメモが一番上に表示、DESC（降順）
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index  #メモを保存した後にトップページへリダイレクト
  end

end
