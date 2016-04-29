defmodule Weather.FormatResult do
  def print_result(values, station_id) do
    title = make_title(station_id)
    IO.write """
    #{title}
    #{String.duplicate("-", String.length(title))}
    """
    print_values(values)
  end
  
  def make_title(station_id) do
    "Weather Report for #{station_id}"
  end
  
  def print_values(values) do
    values 
    |> format_lines()
    |> Enum.each(&IO.puts/1)
  end
  
  def format_lines(values) do
    values
    |> update_tags()
    |> map_to_formatted_lines()
  end
  
  def update_tags(values) do
    Enum.map(values, fn {tag, value} ->
      case tag do
        "temperature_string" -> {"Temperature: ", value }  
        "observation_time"   -> {"Observation Time: ", value } 
        _                    -> {"#{String.capitalize(tag)}: ", value } 
      end
    end)
  end
  
  def map_to_formatted_lines(values) do
    max_length = max_tag_length(values)
    Enum.map(values, fn {tag, value} ->
      this_length = String.length(tag)
      "#{tag}#{String.duplicate(" ", max_length - this_length )}#{value}"
    end)
  end
  
  def max_tag_length(values) do
    {longest, _ } = Enum.max_by(values, fn {tag, _} -> String.length(tag) end)
    String.length(longest)
  end
end
