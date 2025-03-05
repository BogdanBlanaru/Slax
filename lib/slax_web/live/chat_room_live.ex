defmodule SlaxWeb.ChatRoomLive do
  use SlaxWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>Welcome to the chat!</div>

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
end
