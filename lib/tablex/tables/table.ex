defmodule Tablex.Tables.Table do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tablex.Tables.Table

  @schema_prefix 'information_schema'
  schema "tables" do
    field :table_name, :string

    timestamps()
  end

  @doc false
  def changeset(%Table{} = table, attrs) do
    table
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
