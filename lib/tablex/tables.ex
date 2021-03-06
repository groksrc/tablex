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
    tables()
    |> from_information_schema
    |> Repo.all()
    |> format
  end

  @doc """
  Gets a single table.
  """
  def get_table(name) do
    columns =
      public_tables()
      |> select([
        :column_name,
        :ordinal_position,
        :column_default,
        :is_nullable,
        :data_type,
        :character_maximum_length,
        :is_identity
      ])
      |> from_information_schema
      |> where([c], c.table_name == ^name)
      |> Repo.all()

    %{table_name: name, columns: columns}
  end

  defp tables do
    from(
      t in public_tables(),
      select: t.table_name,
      group_by: t.table_name,
      order_by: t.table_name
    )
  end

  defp format(tables) do
    Enum.map(tables, fn t -> get_table(t) end)
  end

  defp from_information_schema(query) do
    query |> Map.put(:prefix, "information_schema")
  end

  defp public_tables do
    from(
      c in "columns",
      where: c.table_schema == "public"
    )
  end
end
