defmodule Thor.BookingsTest do
  use Thor.DataCase

  alias Thor.Bookings

  describe "events" do
    alias Thor.Bookings.Event

    import Thor.BookingsFixtures

    @invalid_attrs %{end_time: nil, ext_id: nil, location: nil, max_attendees: nil, name: nil, start_time: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Bookings.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Bookings.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{end_time: ~U[2022-10-04 10:08:00Z], ext_id: "some ext_id", location: "some location", max_attendees: 42, name: "some name", start_time: ~U[2022-10-04 10:08:00Z]}

      assert {:ok, %Event{} = event} = Bookings.create_event(valid_attrs)
      assert event.end_time == ~U[2022-10-04 10:08:00Z]
      assert event.ext_id == "some ext_id"
      assert event.location == "some location"
      assert event.max_attendees == 42
      assert event.name == "some name"
      assert event.start_time == ~U[2022-10-04 10:08:00Z]
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookings.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{end_time: ~U[2022-10-05 10:08:00Z], ext_id: "some updated ext_id", location: "some updated location", max_attendees: 43, name: "some updated name", start_time: ~U[2022-10-05 10:08:00Z]}

      assert {:ok, %Event{} = event} = Bookings.update_event(event, update_attrs)
      assert event.end_time == ~U[2022-10-05 10:08:00Z]
      assert event.ext_id == "some updated ext_id"
      assert event.location == "some updated location"
      assert event.max_attendees == 43
      assert event.name == "some updated name"
      assert event.start_time == ~U[2022-10-05 10:08:00Z]
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookings.update_event(event, @invalid_attrs)
      assert event == Bookings.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Bookings.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Bookings.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Bookings.change_event(event)
    end
  end
end
