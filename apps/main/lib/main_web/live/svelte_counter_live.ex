defmodule MainWeb.SvelteCounterLive do
  use MainWeb, :live_view

  use LiveSvelte.Components

def render(assigns) do
  ~H"""
  <div>
    <div class="bg-[#eee] rounded p-2 m-2 w-[fit-content]">
      <h1 class="text-xs font-bold flex items-end justify-end">LiveView</h1>
      <div class="flex flex-col justify-center items-center gap-4 p-4">
        <div class="flex flex-row items-center justify-center gap-10">
          <span class="text-xl"><%= @number %></span>
          <button class="plus" phx-click="increment">+1</button>
        </div>
      </div>
    </div>
    <div class="bg-[#eee] rounded p-2 m-2 w-[fit-content]">
      <h1 class="text-xs font-bold flex items-end justify-end">LiveSvelte</h1>
      <.LiveCounter props={%{number: @number}} />
    </div>
  </div>
  """
end

def mount(_session, _params, socket) do
  {:ok, assign(socket, :number, 0)}
end

def handle_event("increment", _values, socket) do
  {:noreply, assign(socket, :number, socket.assigns.number + 1)}
end
end
