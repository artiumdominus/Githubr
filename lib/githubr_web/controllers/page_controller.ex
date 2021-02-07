defmodule GithubrWeb.PageController do
  use GithubrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def sync(conn, params) do
    IO.inspect params
  end
end
