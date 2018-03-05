defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Blog.Auth, repo: Blog.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Blog do
    pipe_through :browser # Use the default browser stack

    resources "/posts", PostController
    resources "/users", UserController, only: [:index, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/", ArticleController, :index
    get "/:url", ArticleController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Blog do
  #   pipe_through :api
  # end
end
