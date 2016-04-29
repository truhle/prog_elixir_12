# OrganizingAProject-6

defmodule Weather.CLI do
  
  import SweetXml
  import Weather.FormatResult, only: [ print_result: 2 ]
  
  @default_tags [ "location", "weather", "temperature_string", "observation_time" ]
  
  @moduledoc """
  Handle the command line parsing and dispatch to various functions that
  end up generating a table of weather data for a given weather station. 
  """
  
  def main(argv) do
    argv
    |> parse_args()
    |> process()
  end
  
  @doc """
  'argv' can be -h or --help, which returns :help.

  Otherwise it is a station_id, and optionally a list of desired tags.

  Return a tuple of  '{ station_id, tags }', , or ':help' if help was given.
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [ help: :boolean],
                                     aliases:  [ h:    :help   ])
    case parse do
      { [help: true], _, _}            -> :help
      {_, [ station_id | [] ], _ }     -> { station_id, @default_tags }
      {_, [ station_id | tags ], _ } -> { station_id, tags }
      _                                -> :help
    end
  end
  
  def process(:help) do
    IO.puts """
    usage:  weather <station_id> [ tags | location, weather, temperature_string, observation_time ]
    """
  end
  
  def process({ station_id, tags }) do
    Weather.WeatherGov.fetch(station_id)
    |> decode_response()
    |> extract_values(tags)
    |> print_result(station_id)
  end
  
  def decode_response( { :ok, xml } ), do: xml
  def decode_response( { :error, _} ) do
    IO.puts "Error fetching from w1.weather.gov."
    System.halt(2)
  end
  
  def extract_values(xml, tags) do
    for tag <- tags do
      { tag, xpath(xml, ~x"//#{tag}/text()") }
    end
  end
  
end
