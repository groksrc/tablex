defmodule TablexWeb.HomeView do
  use TablexWeb, :view
  import Inflex

  def elixir_type(data_type) do
    cond do
      Enum.any?(integer_types(), fn x -> data_type == x end) ->
        ":integer"

      Enum.any?(["double precision", "money", "real"], fn x -> data_type == x end) ->
        ":float"

      Enum.any?(["decimal", "numeric"], fn x -> data_type == x end) ->
        ":decimal"

      Enum.any?(["bytea", "bit"], fn x -> data_type == x end) ->
        ":binary"

      "boolean" == data_type ->
        ":boolean"

      "date" == data_type ->
        ":date"

      "timestamp without time zone" == data_type ->
        ":datetime"

      "timestamp with time zone" == data_type ->
        "DateTime"

      true ->
        ":string"
    end
  end

  def module_name(table_name) do
    table_name
    |> camelize
    |> singularize
  end

  def integer_types do
    [
      "bigint",
      "integer",
      "smallint",
      "smallserial",
      "serial",
      "bigserial"
    ]
  end
end
