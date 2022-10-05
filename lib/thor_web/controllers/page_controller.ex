defmodule ThorWeb.PageController do
  use ThorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
