defmodule Projects.Checklist.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :description, :string
    field :title, :string
    field :priority, Ecto.Enum, values: [:critical, :high, :medium, :low]
    field :state, Ecto.Enum, values: [:to_do, :in_progress, :complete]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title, :description, :priority, :state])
    |> validate_required([:title, :description, :priority, :state])
  end
end
