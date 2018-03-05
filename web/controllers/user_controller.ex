defmodule Blog.UserController do
  use Blog.Web, :controller 
  alias Blog.User

  plug :authenticate when action in [:new, :create]

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)
    
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> Blog.Auth.login(user)
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: article_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end  
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "Only authorized users can see this page")
      |> redirect(to: article_path(conn, :index))
      |> halt()
    end
  end 
 
end
