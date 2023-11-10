defmodule FooBank.Accounts.HashService do
  @moduledoc """
  This module defines the public API for interfacing with the underlying
  Argon2 hash application.
  """

  @doc """
  Hash a string and return a structure ready for a changeset change operation.

  ## Parameters

    - pass: String that is going to be hashed.

  ## Options

  Options passed to add_hash/2 will be passed as is to the underlying hash
  application.

    * `:hash_key` - password hash identifier.
    * the default is :password_hash

  ## Examples

      iex> HashService.add_hash("some.password@1234")
      %{password_hash: password_hash}

      iex> HashService.add_hash("some.password@1234", hash_key: :other_password_hash)
      %{other_password_hash: password_hash}
  """
  @spec add_hash(any(), keyword()) :: %{atom() => String.t()}
  def add_hash(pass, opts \\ []), do: Argon2.add_hash(pass, opts)

  @doc """

  Verifies password by hashing it and comparing to given hash.

  Returns true if hashed password is valid, false otherwise.

  ## Parameters

    - pass: Plain password to be verified.
    - hash: Hash string to be verified.

  ## Examples

      iex> HashService.check_password("some.password@1234", "correct hash")
      true

      iex> HashService.check_password("some.password@1234", "incorrect hash")
      false
  """
  @spec check_password(String.t(), String.t()) :: boolean()
  def check_password(pass, hash), do: Argon2.verify_pass(pass, hash)

  @doc """

  Runs the password hash function but always returns false.

  This function is intended to make it more difficult for any potential attacker
  to find valid document numbers by timing attacks.

  ## Examples

      iex> HashService.dummy_check_password()
      false
  """
  @spec dummy_check_password :: false
  def dummy_check_password, do: Argon2.no_user_verify()

  @doc """

  Hash a string and returns result hash.

  ## Parameters

    - pass: string to be hashed.

  ## Examples

    iex> HashService.hash_password("some.password@1234")
    "password hash"
  """
  @spec hash_password(String.t()) :: String.t()
  def hash_password(pass), do: Argon2.hash_pwd_salt(pass)
end
