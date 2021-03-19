defmodule TodoApi.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :isCompleted, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:name, :isCompleted])
    |> validate_required([:name, :isCompleted])
  end
end
