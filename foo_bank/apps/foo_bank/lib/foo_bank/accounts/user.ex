defmodule FooBank.Accounts.User do
  @moduledoc """

  Defines base User structure and validations for account authentication
  and authorization.

  """

  use Ecto.Schema
  import Ecto.Changeset

  alias FooBank.Accounts.HashService

  @required_fields [:name, :surname, :document_number, :password]
  # Regex used to validate a password.
  # Matches:
  # (?=.*\d) -> At least one digit (number).
  # (?=.*[A-Z]) -> At least one uppercase letter.
  @password_validate_regex ~r/(?=.*\d)(?=.*[A-Z])/

  schema "users" do
    field :name, :string
    field :surname, :string
    field :document_number, :string
    field :password, :string

    timestamps()
  end

  @doc """
  Changeset function for user registration flow.

  Validates required fields, parse document_number and check for uniqueness,
  validate and hashes password.

  ## Parameters

  - user: User type.
  - attrs: changeset attributes to be validated and applied to user.

  ## Examples

      iex> User.changeset(%User{}, %{name: "John", surname: "Smith", document_number: "525.465.170-90", password: "some_password"})
      %Ecto.Changeset{}

  """
  @spec registration_changeset(user, map()) :: Ecto.Changeset.t(user) when user: var
  def registration_changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :surname, :document_number, :password])
    |> validate_required(@required_fields)
    |> validate_password()
    |> hash_password()
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        change(changeset, HashService.add_hash(password, hash_key: :password))

      _ ->
        changeset
    end
  end

  defp validate_password(changeset) do
    changeset
    |> validate_length(:password,
      min: 8,
      max: 128,
      message: "Must be between 8 and 128 characters."
    )
    |> validate_format(
      :password,
      @password_validate_regex,
      message: "Must have at least one uppercase letter and one number."
    )
  end
end
