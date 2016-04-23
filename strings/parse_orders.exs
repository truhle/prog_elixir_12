# StringsAndBinaries-7

defmodule ParseOrders do
  def parse(file) do
    device = File.open!(file)
    key_list = IO.read(device, :line)
               |> String.rstrip()
               |> String.split(",")
               |> Enum.map(&String.to_atom/1)
    IO.stream(device, :line) |> Enum.map( fn line ->
      [id, ship_to, net_amount] = String.rstrip(line) |> String.split(",")
      values = [String.to_integer(id),
                String.lstrip(ship_to, ?:) |> String.to_atom(),
                String.to_float(net_amount)]
      Enum.zip(key_list, values)
    end)
  end

  def output_with_totals(file) do
    parse(file) |> Orders.add_totals()
  end
end

defmodule Orders do
  def add_totals(orders, rates \\ [ NC: 0.075, TX: 0.08 ]) do
    Enum.map(orders, fn order ->
      net_amount = order[:net_amount]
      total = if List.keyfind(rates, order[:ship_to], 0) do
        {_,rate} = List.keyfind(rates, order[:ship_to], 0)
        net_amount * rate + net_amount
      else
        net_amount
      end
      order ++ [ {:total_amount, Float.round(total, 2)} ]
    end)
  end
end

IO.inspect ParseOrders.parse("orders.csv")
IO.inspect ParseOrders.output_with_totals("orders.csv")
