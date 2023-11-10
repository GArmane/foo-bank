defmodule FooBank.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FooBank.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        document_number: "some document_number",
        name: "some name",
        password: "some password",
        surname: "some surname"
      })
      |> FooBank.Accounts.create_user()

    user
  end
end
