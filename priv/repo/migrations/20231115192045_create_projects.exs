defmodule Projects.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
