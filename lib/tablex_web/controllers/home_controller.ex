defmodule TablexWeb.HomeController do
  use TablexWeb, :controller
  alias Tablex.Tables

  def index(conn, _params) do
    render(conn, "index.html", tables: Tables.list_tables())
  end
end
