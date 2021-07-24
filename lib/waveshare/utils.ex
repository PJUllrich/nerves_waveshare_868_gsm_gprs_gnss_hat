defmodule WaveshareHat.Utils do
  @moduledoc """
  Utility functions for the other WaveshareHat modules.
  """

  @doc """
  Inquires the state of the SIM module.
  """
  def status(pid), do: write(pid, "AT")

  @doc """
  Inquires the state of the SIM card.
  """
  def status_sim(pid), do: write(pid, "AT+CPIN?")

  @doc """
  Writes a command to the WaveshareHat Hat.
  """
  def write(pid, cmd) do
    Circuits.UART.write(pid, cmd)
  end

  @doc """
  The "return"-command used for indicating that an action
  should be executed.

  In HEX, this would be equal to "1A".
  """
  def end_mark(pid), do: write(pid, <<26>>)
end
