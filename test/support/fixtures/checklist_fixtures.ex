defmodule Projects.ChecklistFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projects.Checklist` context.
  """

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    {:ok, project} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> Projects.Checklist.create_project()

    project
  end
end
