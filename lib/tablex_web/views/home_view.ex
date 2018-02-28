defmodule TablexWeb.HomeView do
  use TablexWeb, :view

  def elixir_type(data_type) do
    cond do
      Enum.any?(integer_types(), fn(x) -> data_type == x end) ->
        ":integer"
      Enum.any?(["double precision", "money", "real"], fn(x) -> data_type == x end) ->
        ":float"
      Enum.any?(["decimal", "numeric"], fn(x) -> data_type == x end) ->
        "Decimal"
      Enum.any?(["bytea", "bit"], fn(x) -> data_type == x end) ->
        ":binary"
      "boolean" == data_type ->
        ":boolean"
      "date" == data_type ->
        "Date"
      "timestamp without time zone" == data_type ->
        "NaiveDateTime"
      "timestamp with time zone" == data_type ->
        "DateTime"
      true ->
        ":string"
    end
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

  def float_types do

  end
end
