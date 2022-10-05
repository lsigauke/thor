defmodule ThorWeb.EventLive.Index do
  use ThorWeb, :live_view

  alias Thor.Bookings
  alias Thor.Bookings.Event

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :events, list_events())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Event")
    |> assign(:event, Bookings.get_event!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Event")
    |> assign(:event, %Event{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Events")
    |> assign(:event, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    event = Bookings.get_event!(id)
    {:ok, _} = Bookings.delete_event(event)

    {:noreply, assign(socket, :events, list_events())}
  end

  defp list_events do
    Bookings.list_events()
  end
end
