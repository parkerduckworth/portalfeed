defmodule Portalfeed.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :username, :string
      add :likes, :integer
      add :body, :text
      add :flagged, :boolean, default: false, null: false
      add :pub_date, :datetime

      timestamps()
    end

  end
end
