defmodule TorrentData do
  @moduledoc """
  Torrent file parsed data
  """

  defstruct [:filepath, :announce, :info, :files, :length, :name, :piece_length, :pieces]

  @type t(filepath, announce, info, files, length, name, piece_length, pieces) :: %TorrentData{
    filepath: filepath,
    announce: announce,
    info: info,
    files: files,
    length: length,
    name: name,
    piece_length: piece_length,
    pieces: pieces,
  }
end
