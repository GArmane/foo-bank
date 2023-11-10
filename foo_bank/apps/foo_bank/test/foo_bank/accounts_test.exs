defmodule FooBank.AccountsTest do
  use FooBank.DataCase

  alias FooBank.Accounts

  describe "users" do
    import FooBank.AccountsFixtures

    alias FooBank.Accounts.User

    @invalid_attrs %{name: nil, surname: nil, document_number: nil, password: nil}

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        name: "some name",
        surname: "some surname",
        document_number: "973.323.340-46",
        password: "Dev@1234"
      }

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.name == valid_attrs.name
      assert user.surname == valid_attrs.surname
      assert user.document_number == valid_attrs.document_number
      refute user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
  end
end
