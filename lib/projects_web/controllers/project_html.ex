defmodule ProjectsWeb.ProjectHTML do
  use ProjectsWeb, :html

  embed_templates "project_html/*"

  @doc """
  Renders a project form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def project_form(assigns)
end