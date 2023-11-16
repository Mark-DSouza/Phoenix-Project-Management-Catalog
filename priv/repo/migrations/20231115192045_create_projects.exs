defmodule Projects.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string, null: false
      add :description, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
