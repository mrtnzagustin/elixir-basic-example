defmodule AppWeb.SensorController do
  use AppWeb, :controller

  alias App.PlatformI40
  alias App.PlatformI40.Sensor

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    sensors = PlatformI40.list_sensors()
    render(conn, "index.json", sensors: sensors)
  end

  def create(conn, %{"sensor" => sensor_params}) do
    with {:ok, %Sensor{} = sensor} <- PlatformI40.create_sensor(sensor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sensor_path(conn, :show, sensor))
      |> render("show.json", sensor: sensor)
    end
  end

  def show(conn, %{"id" => id}) do
    sensor = PlatformI40.get_sensor!(id)
    render(conn, "show.json", sensor: sensor)
  end

  def update(conn, %{"id" => id, "sensor" => sensor_params}) do
    sensor = PlatformI40.get_sensor!(id)

    with {:ok, %Sensor{} = sensor} <- PlatformI40.update_sensor(sensor, sensor_params) do
      render(conn, "show.json", sensor: sensor)
    end
  end

  def delete(conn, %{"id" => id}) do
    sensor = PlatformI40.get_sensor!(id)

    with {:ok, %Sensor{}} <- PlatformI40.delete_sensor(sensor) do
      send_resp(conn, :no_content, "")
    end
  end
end
