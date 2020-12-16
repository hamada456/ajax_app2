class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC") #新しいメモが一番上に表示、DESC（降順）
  end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index  #メモを保存した後にトップページへリダイレクト
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
