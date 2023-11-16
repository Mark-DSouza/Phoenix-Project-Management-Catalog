defmodule Projects.Repo.Migrations.AddStateEnumToProjects do
  use Ecto.Migration

  def change do
    alter table(:projects) do
      add :state, :string, null: false
    end
  end
end
