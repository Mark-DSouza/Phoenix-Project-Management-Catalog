defmodule Projects.ChecklistTest do
  use Projects.DataCase

  alias Projects.Checklist

  describe "projects" do
    alias Projects.Checklist.Project

    import Projects.ChecklistFixtures

    @invalid_attrs %{description: nil, title: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Checklist.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Checklist.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{description: "some description", title: "some title"}

      assert {:ok, %Project{} = project} = Checklist.create_project(valid_attrs)
      assert project.description == "some description"
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Checklist.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{description: "some updated description", title: "some updated title"}

      assert {:ok, %Project{} = project} = Checklist.update_project(project, update_attrs)
      assert project.description == "some updated description"
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Checklist.update_project(project, @invalid_attrs)
      assert project == Checklist.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Checklist.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Checklist.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Checklist.change_project(project)
    end
  end

  describe "priorities" do
    alias Projects.Checklist.Priority

    import Projects.ChecklistFixtures

    @invalid_attrs %{name: nil}

    test "list_priorities/0 returns all priorities" do
      priority = priority_fixture()
      assert Checklist.list_priorities() == [priority]
    end

    test "get_priority!/1 returns the priority with given id" do
      priority = priority_fixture()
      assert Checklist.get_priority!(priority.id) == priority
    end

    test "create_priority/1 with valid data creates a priority" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Priority{} = priority} = Checklist.create_priority(valid_attrs)
      assert priority.name == "some name"
    end

    test "create_priority/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Checklist.create_priority(@invalid_attrs)
    end

    test "update_priority/2 with valid data updates the priority" do
      priority = priority_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Priority{} = priority} = Checklist.update_priority(priority, update_attrs)
      assert priority.name == "some updated name"
    end

    test "update_priority/2 with invalid data returns error changeset" do
      priority = priority_fixture()
      assert {:error, %Ecto.Changeset{}} = Checklist.update_priority(priority, @invalid_attrs)
      assert priority == Checklist.get_priority!(priority.id)
    end

    test "delete_priority/1 deletes the priority" do
      priority = priority_fixture()
      assert {:ok, %Priority{}} = Checklist.delete_priority(priority)
      assert_raise Ecto.NoResultsError, fn -> Checklist.get_priority!(priority.id) end
    end

    test "change_priority/1 returns a priority changeset" do
      priority = priority_fixture()
      assert %Ecto.Changeset{} = Checklist.change_priority(priority)
    end
  end
end
