# OrganizingAProject-4
# My solution for printing the list of issues in table format with headers and
# even columns.  Made before reading that section of the book.

defmodule PrettyPrint do

  def pretty_print(list_of_issues) do
    make_header(list_of_issues) ++ make_lines(list_of_issues)
    |> Enum.each(&IO.puts/1)
  end

  def make_header(list_of_issues) do
    number_width = get_number_width(list_of_issues)
    created_width = get_created_width(list_of_issues)
    title_width = get_title_width(list_of_issues)
    [
      " #" <> "#{String.duplicate(" ", number_width - 1)}"
      <> "| created_at" <> "#{String.duplicate(" ", created_width - 9)}"
      <> "| title" <> "#{String.duplicate(" ", title_width - 6)}",

      "#{String.duplicate("-", number_width + 1)}" <> "+"
      <> "#{String.duplicate("-", created_width + 2)}" <> "+"
      <> "#{String.duplicate("-", title_width + 1)}"
    ]
  end

  def get_number_width(list_of_issues) do
    list_of_issues
    |> Enum.max_by(fn %{"number" => number} ->
      Integer.to_string(number)
      |> String.length()
    end)
    |> Map.get("number")
    |> Integer.to_string()
    |> String.length()
  end

  def get_created_width(list_of_issues) do
    list_of_issues
    |> List.first()
    |> Map.get("created_at")
    |> String.length()
  end

  def get_title_width(list_of_issues) do
    list_of_issues
    |> Enum.max_by(fn %{"title" => title} ->
      String.length(title)
    end)
    |> Map.get("title")
    |> String.length()
  end

  def make_lines(list_of_issues) do
    list_of_issues
    |> Enum.map(&make_line/1)
  end

  def make_line(%{"number" => number,
  "created_at" => created_at,
  "title" => title }) do
    "#{number} | #{created_at} | #{title}"
  end

end
