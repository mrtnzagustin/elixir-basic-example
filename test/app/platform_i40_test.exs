defmodule App.PlatformI40Test do
  use App.DataCase

  alias App.PlatformI40

  describe "sensors" do
    alias App.PlatformI40.Sensor

    @valid_attrs %{name: "some name", sampling_rate: 42, type: "some type"}
    @update_attrs %{name: "some updated name", sampling_rate: 43, type: "some updated type"}
    @invalid_attrs %{name: nil, sampling_rate: nil, type: nil}

    def sensor_fixture(attrs \\ %{}) do
      {:ok, sensor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PlatformI40.create_sensor()

      sensor
    end

    test "list_sensors/0 returns all sensors" do
      sensor = sensor_fixture()
      assert PlatformI40.list_sensors() == [sensor]
    end

    test "get_sensor!/1 returns the sensor with given id" do
      sensor = sensor_fixture()
      assert PlatformI40.get_sensor!(sensor.id) == sensor
    end

    test "create_sensor/1 with valid data creates a sensor" do
      assert {:ok, %Sensor{} = sensor} = PlatformI40.create_sensor(@valid_attrs)
      assert sensor.name == "some name"
      assert sensor.sampling_rate == 42
      assert sensor.type == "some type"
    end

    test "create_sensor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PlatformI40.create_sensor(@invalid_attrs)
    end

    test "update_sensor/2 with valid data updates the sensor" do
      sensor = sensor_fixture()
      assert {:ok, %Sensor{} = sensor} = PlatformI40.update_sensor(sensor, @update_attrs)
      assert sensor.name == "some updated name"
      assert sensor.sampling_rate == 43
      assert sensor.type == "some updated type"
    end

    test "update_sensor/2 with invalid data returns error changeset" do
      sensor = sensor_fixture()
      assert {:error, %Ecto.Changeset{}} = PlatformI40.update_sensor(sensor, @invalid_attrs)
      assert sensor == PlatformI40.get_sensor!(sensor.id)
    end

    test "delete_sensor/1 deletes the sensor" do
      sensor = sensor_fixture()
      assert {:ok, %Sensor{}} = PlatformI40.delete_sensor(sensor)
      assert_raise Ecto.NoResultsError, fn -> PlatformI40.get_sensor!(sensor.id) end
    end

    test "change_sensor/1 returns a sensor changeset" do
      sensor = sensor_fixture()
      assert %Ecto.Changeset{} = PlatformI40.change_sensor(sensor)
    end
  end
end
