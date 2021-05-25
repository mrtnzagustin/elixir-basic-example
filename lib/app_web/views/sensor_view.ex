defmodule AppWeb.SensorView do
  use AppWeb, :view
  alias AppWeb.SensorView

  def render("index.json", %{sensors: sensors}) do
    %{data: render_many(sensors, SensorView, "sensor.json")}
  end

  def render("show.json", %{sensor: sensor}) do
    %{data: render_one(sensor, SensorView, "sensor.json")}
  end

  def render("sensor.json", %{sensor: sensor}) do
    %{id: sensor.id,
      name: sensor.name,
      type: sensor.type,
      sampling_rate: sensor.sampling_rate}
  end
end
