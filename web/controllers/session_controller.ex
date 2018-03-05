defmodule Blog.SessionController do
  use Blog.Web, :controller
  
  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"username" => user, "password" => pass}}) do
    case Blog.Auth.login_by_user_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome Back!")
        |> redirect(to: article_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password.")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Blog.Auth.logout()
    |> redirect(to: article_path(conn, :index))
  end
end
