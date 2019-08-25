defmodule Portalfeed.Feed.Post do
  use Ecto.Schema
  import Ecto.Changeset


  schema "posts" do
    field :body, :string
    field :flagged, :boolean, default: false
    field :likes, :integer
    field :pub_date, :utc_datetime
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:username, :likes, :body, :flagged, :pub_date])
    |> validate_required([:username, :likes, :body, :flagged, :pub_date])
  end
end
