# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Portalfeed.Repo.insert!(%Portalfeed.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Portalfeed.Feed.Post
alias Portalfeed.Repo

%Post{
  username: "parkerduckworth", 
  body: "How long ago do you think zuck realized the people would rebel? From the beginning?",
  likes: 0,
  flagged: false,
  pub_date: DateTime.utc_now() 
} |> Repo.insert!

%Post{
  username: "ericdeansanchez", 
  body: "hmmm depends on what you mean by that",
  likes: 0,
  flagged: false,
  pub_date: DateTime.utc_now() 
} |> Repo.insert!
