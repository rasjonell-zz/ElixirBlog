defmodule Blog.Post do
  use Blog.Web, :model  


  schema "posts" do
    field :title, :string
    field :url, :string
    field :content, :string
    field :excerpt, :string
    field :date_published, :date
    field :published, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :url, :content, :excerpt, :date_published, :published])
    |> validate_required([:title, :url, :content, :excerpt, :published])
  end
end
