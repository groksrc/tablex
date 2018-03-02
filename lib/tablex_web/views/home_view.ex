defmodule TablexWeb.HomeView do
  use TablexWeb, :view
  import Inflex

  def elixir_type(column) do
    column
    |> data_type
    |> default_value
  end

  def module_name(table_name) do
    table_name
    |> camelize
    |> singularize
  end

  defp data_type(%{
        data_type: data_type,
        is_identity: is_identity,
        column_name: column_name,
        ordinal_position: ordinal_position
      } = input) do
    type =
      cond do
        true == is_identity or {"id", 1} == {column_name, ordinal_position} ->
          ":primary_key"

        data_type in integer_types() ->
          ":integer"

        data_type in ["double precision", "money", "real"] ->
          ":float"

        data_type in ["decimal", "numeric"] ->
          ":decimal"

        data_type in ["bytea", "bit"] ->
          ":binary"

        "boolean" == data_type ->
          ":boolean"

        "date" == data_type ->
          ":date"

        "timestamp without time zone" == data_type ->
          ":datetime"

        "timestamp with time zone" == data_type ->
          ":utc_datetime"

        true ->
          ":string"
      end

    %{ input | data_type: type }
  end

  defp default_value(%{data_type: data_type, column_default: column_default}) do
    if data_type in [":integer", ":float", ":boolean"] and String.valid?(column_default) do
      data_type <> ", default: " <> column_default
    else
      data_type
    end
  end

  defp integer_types do
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
