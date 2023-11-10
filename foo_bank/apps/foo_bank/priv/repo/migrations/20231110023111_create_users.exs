defmodule FooBank.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :surname, :string
      add :document_number, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:users, [:document_number])
  end
end
