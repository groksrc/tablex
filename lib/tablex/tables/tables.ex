defmodule Tablex.Tables do
  @moduledoc """
  The Tables context.
  """

  import Ecto.Query, warn: false
  alias Tablex.Repo

  @doc """
  Returns the list of tables.
  """
  def list_tables do
    from(
      t in "tables",
      where: t.table_schema == "public",
      select: t.table_name
    )
    |> Map.put(:prefix, "information_schema")
    |> Repo.all()
  end

  @doc """
  Gets a single table.
  """
  def get_table(name) do
    table_query(name)
    |> Map.put(:prefix, "information_schema")
    |> Repo.all()
  end

  defp table_query(name) do
    from(
      c in "columns",
      where: c.table_name == ^name,
      select: [
        :column_name,
        :ordinal_position,
        :column_default,
        :is_nullable,
        :data_type,
        :character_maximum_length,
        :is_identity
      ]
    )
  end
end
