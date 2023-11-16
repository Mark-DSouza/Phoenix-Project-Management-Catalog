defmodule ProjectsWeb.ProjectHTML do
  use ProjectsWeb, :html

  embed_templates "project_html/*"

  @doc """
  Renders a project form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def project_form(assigns)

  def capitalize_priority(atom) when is_atom(atom) do
    atom |> to_string() |> String.capitalize()
  end

  def priority_opts(changeset) do
    existing_priority = changeset |> Ecto.Changeset.get_change(:priority, [])

    Enum.map(
      Ecto.Enum.values(Projects.Checklist.Project, :priority),
      fn priority ->
      [
        key: capitalize_priority(priority),
        value: priority,
        selected: priority == existing_priority
      ] end
    )
  end

  def capitalize_state(state_value) do
    state_value
      |> to_string()
      |> String.split("_")
      |> Enum.map(&String.capitalize(&1))
      |> Enum.join(" ")
  end

  def state_opts(changeset) do
    existing_state = changeset |> Ecto.Changeset.get_change(:state, [])

    Enum.map(
      Ecto.Enum.values(Projects.Checklist.Project, :state),
      fn state_value ->
      [
        key: capitalize_state(state_value),
        value: state_value,
        selected: state_value == existing_state
      ] end
    )
  end
end
