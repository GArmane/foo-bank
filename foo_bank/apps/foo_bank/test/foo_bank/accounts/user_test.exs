defmodule FooBank.AccountTest.UserTest do
  use FooBank.DataCase

  alias FooBank.Accounts.User

  @valid_attrs %{
    name: "John",
    surname: "Smith",
    document_number: "328.673.550-79",
    password: "Dev@1234"
  }
  @invalid_attrs %{password: "dev"}

  describe "registration_changeset/2" do
    test "with valid attrs" do
      changeset = User.registration_changeset(%User{}, @valid_attrs)
      assert changeset.valid?
    end

    test "with invalid attrs" do
      changeset = User.registration_changeset(%User{}, @invalid_attrs)
      refute changeset.valid?
    end

    test "validates required fields" do
      changeset = User.registration_changeset(%User{}, %{})

      assert errors_on(changeset) == %{
               name: ["can't be blank"],
               surname: ["can't be blank"],
               document_number: ["can't be blank"],
               password: ["can't be blank"]
             }
    end

    test "validates password min length" do
      input = Enum.join(["A1", String.duplicate("a", 5)])

      changeset =
        User.registration_changeset(%User{}, Map.merge(@valid_attrs, %{password: input}))

      assert errors_on(changeset) == %{password: ["Must be between 8 and 128 characters."]}
    end

    test "validates password max length" do
      input = Enum.join(["A1", String.duplicate("a", 128)])

      changeset =
        User.registration_changeset(%User{}, Map.merge(@valid_attrs, %{password: input}))

      assert errors_on(changeset) == %{password: ["Must be between 8 and 128 characters."]}
    end

    test "validates password format" do
      changeset =
        User.registration_changeset(%User{}, Map.merge(@valid_attrs, %{password: "password"}))

      assert errors_on(changeset) == %{
               password: [
                 "Must have at least one uppercase letter and one number."
               ]
             }
    end

    test "hashes password" do
      password = "test@1234"
      changeset = User.registration_changeset(%User{}, @valid_attrs)

      refute changeset.changes.password == password
    end
  end
end
