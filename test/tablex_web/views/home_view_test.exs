defmodule TablexWeb.HomeViewTest do
  use TablexWeb.ConnCase, async: true

  import Phoenix.View

  test "renders index.html" do
    index = render_to_string(TablexWeb.HomeView, "index.html", [tables: [test_table()]])
    assert String.contains? index, "Tablex"
    assert String.contains? index, "<v-app>"
  end

  test "renders schema.html" do
    schema = render_to_string(TablexWeb.HomeView, "schema.html", [table: test_table()])
    assert String.contains? schema, "defmodule"
    assert String.contains? schema, "schema"
  end

  test "renders column.html" do
    %{ columns: columns } = test_table()
    column = render_to_string(TablexWeb.HomeView, "column.html", [column: List.first(columns)])
    assert "field :id, :primary_key" == column
  end

  def test_table do
    %{
      columns: [
        %{
          character_maximum_length: nil,
          column_default: "nextval('margin_types_id_seq'::regclass)",
          column_name: "id",
          data_type: "integer",
          is_identity: "NO",
          is_nullable: "NO",
          ordinal_position: 1
        },
        %{
          character_maximum_length: 255,
          column_default: nil,
          column_name: "name",
          data_type: "character varying",
          is_identity: "NO",
          is_nullable: "NO",
          ordinal_position: 2
        }
      ],
      table_name: "system_types"
    }
  end
end
