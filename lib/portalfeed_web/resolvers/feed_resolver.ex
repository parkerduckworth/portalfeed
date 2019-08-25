defmodule PortalfeedWeb.FeedResolver do
  alias Portalfeed.Feed

  def all_posts(_root, _args, _info) do
    posts = Feed.list_posts()
    {:ok, posts}
  end
end