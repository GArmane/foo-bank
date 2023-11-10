defmodule FooBank.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false

  alias ElixirSense.Plugins.Ecto
  alias FooBank.Repo
  alias FooBank.Accounts.User

  @doc """
  Creates an user.

  ## Parameters

    - attrs: user registration data

  ## Examples

    iex> create_user(%{field: value})
    {:ok, %User{}}

    iex> create_user(%{field: bad_value})
    {:error, %Ecto.Changeset{}}

  """
  @spec create_user(attrs :: map) :: {:ok, User.t()} | {:error, Ecto.Changeset.t()}
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end
end
