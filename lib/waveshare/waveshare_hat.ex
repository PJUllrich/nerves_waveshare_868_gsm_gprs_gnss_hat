defmodule WaveshareHat do
  @moduledoc """
  A convenience wrapper for the commands of the WaveshareHat GSM/GPRS/GNSS Hat for Raspberry Pi's.

  This documentation includes only parts of the official documentation.
  For further information, please have a look at the official manuals in `/test/manuals`.

  This library offers helper functions for sending common commands to the WaveshareHat GSM/GPRS/GNSS Hat.
  It uses `Circuits.UART` for sending these commands.

  We recommend configuring your UART connection to use a `\\r\\n`-separator:

      Circuits.UART.configure(pid, framing: {Circuits.UART.Framing.Line, separator: "\\r\\n"})

  Otherwise, you must write the line separator yourself after every command:

      iex> WaveshareHat.status_sim(pid)
      :ok
      iex> WaveshareHat.write(pid, "\\r\\n")
      :ok

  ## Example

      iex> {:ok, pid} = Circuits.UART.start_link
      {:ok, #PID<0.132.0>}
      iex> Circuits.UART.open(pid, "/dev/ttyAMA0", speed: 115200)
      :ok
      iex> Circuits.UART.configure(pid, framing: {Circuits.UART.Framing.Line, separator: "\\r\\n"})
      :ok
      iex> WaveshareHat.status_sim(pid)
      :ok
      iex> flush
      {:nerves_uart, "/dev/ttyAMA0", "AT+CPIN?\\r"}
      {:nerves_uart, "/dev/ttyAMA0", "+CPIN: READY"}
      {:nerves_uart, "/dev/ttyAMA0", ""}
      {:nerves_uart, "/dev/ttyAMA0", "OK"}
      :ok
  """
  defdelegate connect(port), to: WaveshareHat.Utils
  defdelegate status(pid), to: WaveshareHat.Utils
  defdelegate status_sim(pid), to: WaveshareHat.Utils
  defdelegate write(pid, cmd), to: WaveshareHat.Utils
  defdelegate end_mark(pid), to: WaveshareHat.Utils
end
