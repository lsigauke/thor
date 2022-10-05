defmodule Thor.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :start_time, :utc_datetime
      add :end_time, :utc_datetime
      add :max_attendees, :integer
      add :location, :string
      add :ext_id, :string

      timestamps()
    end
  end
end
