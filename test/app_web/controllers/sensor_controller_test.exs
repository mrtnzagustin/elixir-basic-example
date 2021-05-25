defmodule AppWeb.SensorControllerTest do
  use AppWeb.ConnCase

  alias App.PlatformI40
  alias App.PlatformI40.Sensor

  @create_attrs %{
    name: "some name",
    sampling_rate: 42,
    type: "some type"
  }
  @update_attrs %{
    name: "some updated name",
    sampling_rate: 43,
    type: "some updated type"
  }
  @invalid_attrs %{name: nil, sampling_rate: nil, type: nil}

  def fixture(:sensor) do
    {:ok, sensor} = PlatformI40.create_sensor(@create_attrs)
    sensor
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sensors", %{conn: conn} do
      conn = get(conn, Routes.sensor_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sensor" do
    test "renders sensor when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sensor_path(conn, :create), sensor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sensor_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "sampling_rate" => 42,
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sensor_path(conn, :create), sensor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sensor" do
    setup [:create_sensor]

    test "renders sensor when data is valid", %{conn: conn, sensor: %Sensor{id: id} = sensor} do
      conn = put(conn, Routes.sensor_path(conn, :update, sensor), sensor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sensor_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "sampling_rate" => 43,
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sensor: sensor} do
      conn = put(conn, Routes.sensor_path(conn, :update, sensor), sensor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sensor" do
    setup [:create_sensor]

    test "deletes chosen sensor", %{conn: conn, sensor: sensor} do
      conn = delete(conn, Routes.sensor_path(conn, :delete, sensor))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sensor_path(conn, :show, sensor))
      end
    end
  end

  defp create_sensor(_) do
    sensor = fixture(:sensor)
    %{sensor: sensor}
  end
end
