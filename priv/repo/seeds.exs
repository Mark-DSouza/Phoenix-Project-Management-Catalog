# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Projects.Repo.insert!(%Projects.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

for priority <- ["Critical", "High", "Medium", "Low"] do
  {:ok, _} = Projects.Checklist.create_priority(%{name: priority})
end
