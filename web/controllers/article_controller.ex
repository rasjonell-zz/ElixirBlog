defmodule Blog.ArticleController do
  use Blog.Web, :controller

  alias Blog.Post

  def index(conn, _params) do
    posts = Repo.all(from p in Post, where: p.published == true, order_by: [desc: p.date_published])
    render conn, "index.html", posts: posts
  end

  def show(conn, %{"url" => url}) do
    post = Repo.get_by!(Post, url: url)
    render conn, "show.html", post: post
  end
end
