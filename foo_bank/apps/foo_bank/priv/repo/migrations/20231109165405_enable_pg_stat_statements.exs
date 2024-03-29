defmodule FooBank.Repo.Migrations.EnablePgStatStatements do
  use Ecto.Migration

  def up do
    if Mix.env() == :dev do
      execute "CREATE EXTENSION IF NOT EXISTS pg_stat_statements"
    end
  end

  def down do
    execute "DROP EXTENSION IF EXISTS pg_stat_statements"
  end
end
