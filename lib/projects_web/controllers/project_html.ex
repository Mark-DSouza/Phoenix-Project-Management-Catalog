defmodule ProjectsWeb.ProjectHTML do
  use ProjectsWeb, :html

  embed_templates "project_html/*"

  @doc """
  Renders a project form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def project_form(assigns)

  def priority_opts(changeset) do
    existing_priority = changeset |> Ecto.Changeset.get_change(:priority, [])

    Enum.map(
      Ecto.Enum.values(Projects.Checklist.Project, :priority),
      fn priority ->
      [
        key: priority |> to_string() |> String.capitalize(),
        value: priority,
        selected: priority == existing_priority
      ] end
    )
  end
end
