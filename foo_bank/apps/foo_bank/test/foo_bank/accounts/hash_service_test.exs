defmodule FooBank.AccountsTest.HashServiceTest do
  use FooBank.DataCase, async: true

  alias FooBank.Accounts.HashService

  describe "add_hash/1" do
    test "hashes password into a map" do
      input = "password"
      %{password_hash: hash} = HashService.add_hash(input)
      refute hash == input
    end
  end

  describe "check_password/2" do
    test "returns true for valid passwords" do
      input = "password"
      hash = HashService.hash_password(input)
      assert HashService.check_password(input, hash)
    end

    test "returns false for invalid passwords" do
      right_input = "password"
      wrong_input = "password2"
      hash = HashService.hash_password(right_input)
      refute HashService.check_password(wrong_input, hash)
    end
  end

  describe "dummy_check_password/0" do
    test "always returns false" do
      refute HashService.dummy_check_password()
    end
  end

  describe "hash_password/1" do
    test "hashes password" do
      input = "password"
      hash = HashService.hash_password(input)
      refute hash == input
    end
  end
end
