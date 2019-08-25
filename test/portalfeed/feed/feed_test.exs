defmodule Portalfeed.FeedTest do
  use Portalfeed.DataCase

  alias Portalfeed.Feed

  describe "posts" do
    alias Portalfeed.Feed.Post

    @valid_attrs %{body: "some body", flagged: true, likes: 42, pub_date: "2010-04-17 14:00:00.000000Z", username: "some username"}
    @update_attrs %{body: "some updated body", flagged: false, likes: 43, pub_date: "2011-05-18 15:01:01.000000Z", username: "some updated username"}
    @invalid_attrs %{body: nil, flagged: nil, likes: nil, pub_date: nil, username: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Feed.create_post()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Feed.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Feed.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      assert {:ok, %Post{} = post} = Feed.create_post(@valid_attrs)
      assert post.body == "some body"
      assert post.flagged == true
      assert post.likes == 42
      assert post.pub_date == DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")
      assert post.username == "some username"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feed.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      assert {:ok, post} = Feed.update_post(post, @update_attrs)
      assert %Post{} = post
      assert post.body == "some updated body"
      assert post.flagged == false
      assert post.likes == 43
      assert post.pub_date == DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")
      assert post.username == "some updated username"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Feed.update_post(post, @invalid_attrs)
      assert post == Feed.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Feed.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Feed.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Feed.change_post(post)
    end
  end
end
