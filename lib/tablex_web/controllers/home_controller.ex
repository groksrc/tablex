defmodule TablexWeb.HomeController do
  use TablexWeb, :controller
  alias Tablex.Tables

  defmodule Table do
    defstruct [:name]
  end

  def index(conn, _params) do
    render conn, "index.html", tables: Tables.list_tables
  end

  def show(conn, %{ "table_name" => table_name }) do
    render conn, "show.html", table: Tables.get_table(table_name)
  end

end
