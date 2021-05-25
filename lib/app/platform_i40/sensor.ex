defmodule App.PlatformI40.Sensor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sensors" do
    field :name, :string
    field :sampling_rate, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(sensor, attrs) do
    sensor
    |> cast(attrs, [:name, :type, :sampling_rate])
    |> validate_required([:name, :type, :sampling_rate])
  end
end
