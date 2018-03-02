defmodule TablexWeb.PageControllerTest do
  use TablexWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Tablex"
  end
end
