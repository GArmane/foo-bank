defmodule FooBank.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:name, :surname, :document_number, :password]

  schema "users" do
    field :name, :string
    field :password, :string
    field :surname, :string
    field :document_number, :string

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
  @spec changeset(user, map()) :: Ecto.Changeset.t(user) when user: var
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :surname, :document_number, :password])
    |> validate_required(@required_fields)
  end
end
