defmodule App.Repo.Migrations.CreateSensors do
  use Ecto.Migration

  def change do
    create table(:sensors) do
      add :name, :string
      add :type, :string
      add :sampling_rate, :integer

      timestamps()
    end

  end
end
