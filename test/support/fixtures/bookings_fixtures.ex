defmodule Thor.BookingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Thor.Bookings` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        end_time: ~U[2022-10-04 10:08:00Z],
        ext_id: "some ext_id",
        location: "some location",
        max_attendees: 42,
        name: "some name",
        start_time: ~U[2022-10-04 10:08:00Z]
      })
      |> Thor.Bookings.create_event()

    event
  end
end
