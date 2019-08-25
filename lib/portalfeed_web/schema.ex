defmodule PortalfeedWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom

  alias PortalfeedWeb.FeedResolver

  object :post do
    field :id, non_null(:id)
    field :username, non_null(:string)
    field :body, non_null(:string)
    field :likes, non_null(:integer)
    field :flagged, non_null(:boolean)
    field :pub_date, non_null(:datetime)
  end

  query do
    # this is the query entry point to our app
    field :all_posts, non_null(list_of(non_null(:post))) do
      resolve &FeedResolver.all_posts/3
    end
  end

  mutation do
    field :create_post, :post do
      arg :username, non_null(:string)
      arg :body, non_null(:string)
      arg :likes, non_null(:integer)
      arg :flagged, non_null(:boolean)
      arg :pub_date, non_null(:datetime)

      resolve &FeedResolver.create_post/3
    end
  end
end
