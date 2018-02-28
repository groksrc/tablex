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
    table_info()
    |> from_information_schema
    |> Repo.all
  end

  def table_info do
    from(
      t in public_tables(),
      select: [t.table_name, count(t.table_name)],
      group_by: t.table_name,
      order_by: t.table_name
    )
  end

  @doc """
  Gets a single table.
  """
  def get_table(name) do
    columns = public_tables()
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
    %{ table_name: name, columns: columns }
  end

  def from_information_schema(query) do
    query
    |> Map.put(:prefix, "information_schema")
  end

  def public_tables do
    from(
      c in "columns",
      where: c.table_schema == "public"
    )
  end

end
