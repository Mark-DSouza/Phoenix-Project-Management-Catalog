defmodule Projects.Repo.Migrations.CreatePriorities do
  use Ecto.Migration

  def change do
    create table(:priorities) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
