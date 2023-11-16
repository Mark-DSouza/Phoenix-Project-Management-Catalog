defmodule ProjectsWeb.ProjectHTML do
  use ProjectsWeb, :html

  embed_templates "project_html/*"

  @doc """
  Renders a project form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def project_form(assigns)

  def capitalize_atom(atom) do
    atom
      |> to_string()
      |> String.split("_")
      |> Enum.map(&String.capitalize(&1))
      |> Enum.join(" ")
  end

  def select_options(changeset, field) do
    existing_selection = changeset |> Ecto.Changeset.get_change(field, [])

    Enum.map(
      Ecto.Enum.values(Projects.Checklist.Project, field),
      fn value ->
      [
        key: capitalize_atom(value),
        value: value,
        selected: value == existing_selection
      ] end
    )
  end
end
