defmodule SlaxWeb.ChatRoomLive do
  use SlaxWeb, :live_view

  alias Slax.Chat.Room
  alias Slax.Repo

  def render(assigns) do
    ~H"""
    <div class="flex flex-col grow shadow-lg">
      <div class="flex justify-between items-center shrink-0
        h-16 bg-white border-b border-slate-300 px-4">
        <div class="flex flex-col gap-1.5">
          <h1 class="text-sm font-bold leading-none">
            {@room.name}
          </h1>
          
          <div
            class={["text-xs leading-none h-3.5", @hide_topic? && "text-slate-600"]}
            phx-click="toggle-topic"
          >
            <%= if @hide_topic? do %>
              <span class="text-slate-600">[Hidden topic]</span>
            <% else %>
              {@room.topic}
            <% end %>
          </div>
        </div>
      </div>
    </div>

    <%!-- This is a comment
    <div>{2 + 2}</div>

    <div id={"person-#{person_id}"} class="person"></div>

    <div class=["person", age >= 18 && "adult"]></div>

    <div id="person">
    <%= if person.age >= 18 do %>
      <span>Adult</span>
    <%= else %>
       <span>Child</span>
    <%= end %>
    </div>

    <div>
    <span :if={person.age >= 18}>Adult</span>
    </div> --%>
    """
  end

  def mount(_params, _session, socket) do
    # {:ok, socket}

    room = Room |> Repo.all() |> List.first()
    {:ok, assign(socket, hide_topic?: false, room: room)}

    # socket =
    #   socket
    #   |> assign(:room, room)
    #   |> assign(:director, "Tommy H.")

    # {:ok, socket}

    # socket = assign(socket, room: room, director: "Tommy H.")
  end

  def handle_event("toggle-topic", _params, socket) do
    {:noreply, update(socket, :hide_topic?, &(!&1))}
  end
end
