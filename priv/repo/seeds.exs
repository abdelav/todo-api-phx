# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TodoApi.Repo.insert!(%TodoApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


TodoApi.Repo.insert!(%TodoApi.Todos.Todo{name: "Walk your dog...", isCompleted: false})
TodoApi.Repo.insert!(%TodoApi.Todos.Todo{name: "Feed your cat :3", isCompleted: false})
TodoApi.Repo.insert!(%TodoApi.Todos.Todo{name: "learn phx basics", isCompleted: true})
