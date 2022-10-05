defmodule Thor.Bookings.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :end_time, :utc_datetime
    field :ext_id, :string
    field :location, :string
    field :max_attendees, :integer
    field :name, :string
    field :start_time, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :start_time, :end_time, :max_attendees, :location, :ext_id])
    |> validate_required([:name, :start_time, :end_time, :max_attendees, :location, :ext_id])
  end
end
