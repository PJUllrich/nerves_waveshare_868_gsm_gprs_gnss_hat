defmodule Waveshare do
  @moduledoc """
  A convenience wrapper for the commands of the Waveshare GSM/GPRS/GNSS Hat for Raspberry Pi's.

  This documentation includes only parts of the official documentation.
  For further information, please have a look at the official manuals in `/test/manuals`.

  This library offers helper functions for sending common commands to the Waveshare GSM/GPRS/GNSS Hat.
  It uses `Nerves.UART` for sending these commands.

  We recommend configuring your UART connection to use a `\\r\\n`-separator:

      Nerves.UART.configure(pid, framing: {Nerves.UART.Framing.Line, separator: "\\r\\n"})

  Otherwise, you must write the line separator yourself after every command:

      iex> Waveshare.status_sim(pid)
      :ok
      iex> Waveshare.write(pid, "\\r\\n")
      :ok

  ## Example

      iex> {:ok, pid} = Nerves.UART.start_link
      {:ok, #PID<0.132.0>}
      iex> Nerves.UART.open(pid, "/dev/ttyAMA0", speed: 115200)
      :ok
      iex> Nerves.UART.configure(pid, framing: {Nerves.UART.Framing.Line, separator: "\\r\\n"})
      :ok
      iex> Waveshare.status_sim(pid)
      :ok
      iex> flush
      {:nerves_uart, "/dev/ttyAMA0", "AT+CPIN?\\r"}
      {:nerves_uart, "/dev/ttyAMA0", "+CPIN: READY"}
      {:nerves_uart, "/dev/ttyAMA0", ""}
      {:nerves_uart, "/dev/ttyAMA0", "OK"}
      :ok
  """
  defdelegate status(pid), to: Waveshare.Utils
  defdelegate status_sim(pid), to: Waveshare.Utils
  defdelegate write(pid, cmd), to: Waveshare.Utils
  defdelegate end_mark(pid), to: Waveshare.Utils
end
