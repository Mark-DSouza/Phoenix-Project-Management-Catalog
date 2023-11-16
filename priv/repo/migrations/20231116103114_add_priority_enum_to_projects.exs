defmodule Projects.Repo.Migrations.AddPriorityEnumToProjects do
  use Ecto.Migration

  def change do
    alter table(:projects) do
      add :priority, :string, null: false
    end
  end
end
