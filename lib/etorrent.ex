defmodule Etorrent do
  @moduledoc """
  Base module for the eTorrent client
  """
  use Bencoding

  @spec read_torrent_file(binary()) :: {:ok, TorrentData.t()} | {:error, binary()}
  def read_torrent_file(file_path) do
    if !File.exists?(file_path), do: {:error, "Invalid file path."}, else: do_read_torrent_file(file_path)
  end

  defp do_read_torrent_file(file_path) when is_binary(file_path) do
    result = file_path
      |> File.read!()
      |> Bencoding.Decoder.decode

      do_read_torrent_file(file_path, result)
  end

  defp do_read_torrent_file(file_path, {:ok, result}) when is_map(result) do
    {:ok, parse_torrent_data(file_path, result)}
  end

  defp do_read_torrent_file(file_path, {:ok, result}) when not is_map(result) do
    {:error, ~s/Invalid file format for file #{file_path}./}
  end

  defp do_read_torrent_file(_file_path, {:error, err}) do
    {:error, err}
  end

  @spec parse_torrent_data(binary(), map()) :: TorrentData.t()
  defp parse_torrent_data(file_path, result) do
    %TorrentData{
      filepath: file_path,
      announce: result["announce"],
      info: result["info"],
      files: result["files"],
      length: result["length"],
      name: result["name"],
      piece_length: result["piece_length"],
      pieces: result["pieces"],
    }
  end
end
