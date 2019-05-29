defmodule Chat.PageController do
  use Chat.Web, :controller

  def index(conn, _params) do
    self_node = inspect(node())
    nodes = inspect(Node.list())
    render(conn, "index.html", %{node: self_node, nodes: nodes})
  end
end
