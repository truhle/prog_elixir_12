defmodule CliTest do
  use ExUnit.Case
  doctest Weather
  
  import Weather.CLI, only: [ parse_args: 1 ]
  
  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h",     "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "two values returned if two given" do
    assert parse_args(["station", "v1", "v2"]) == { "station", ["v1", "v2"] }
  end

  test "values is defaulted if two values given" do
    assert parse_args(["station"]) == { "station", [ "location", 
                                        "weather", "temperature_string",
                                        "observation_time" ] }
  end
end
