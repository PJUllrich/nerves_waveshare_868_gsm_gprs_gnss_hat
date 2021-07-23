defmodule Waveshare.GPRS do
  @moduledoc """
  Includes helper functions for sending and receiving data via GPRS
  """
  import Waveshare.Utils

  @doc """
  Check whether a GPRS module is attached.
  """
  def get_attachment_status(pid), do: write(pid, "AT+CGATT?")

  def set_apn(pid, apn, user \\ nil, pw \\ nil) do
    info =
      if user && pw do
        "\"#{apn}\",\"#{user}\",\"#{pw}\""
      else
        "\"#{apn}\""
      end

    write(pid, "AT+CSTT=#{info}")
  end

  @doc """
  Enable the wireless connection with GPRS.
  """
  def start_wireless_connection(pid) do
    write(pid, "AT+CIICR")
  end

  @doc """
  Gets your local IP address when connected.
  """
  def get_local_ip(pid) do
    write(pid, "AT+CIFSR")
  end

  @doc """
  Connect to a server with a `mode` (`TCP` or `UDP`), ip address, and port.
  """
  def connect(pid, mode, ip, port) do
    write(pid, "AT+CIPSTART=\"#{mode}\",\"#{ip}\",\"#{port}\"")
  end

  @doc """
  Start data input to send to the connected server.

  Enter any data after executing this function with `Waveshare.Utils.write(pid, "> MY DATA HERE")`
  End the input with `commit_data/1`.
  """
  def start_sending_data(pid) do
    write(pid, "AT+CIPSEND")
  end

  @doc """
  Finishes the data input and instructs the Waveshare module to send the data to the connected server.
  """
  def commit_data(pid) do
    end_mark(pid)
  end
end
