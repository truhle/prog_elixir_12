# ListsAndRecursion-8

defmodule Orders do
  def add_totals(rates, orders) do
    Enum.map(orders, fn order ->
      net_amount = order[:net_amount]
      total = if List.keyfind(rates, order[:ship_to], 0) do
        {_,rate} = List.keyfind(rates, order[:ship_to], 0)
        net_amount * rate + net_amount
      else
        net_amount
      end
      [ {:total_amount, total} | order ]
    end)
  end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]
orders = [
  [id: 123, ship_to: :NC, net_amount: 100.00 ],
  [id: 124, ship_to: :OK, net_amount:  35.50 ],
  [id: 125, ship_to: :TX, net_amount:  24.00 ],
  [id: 126, ship_to: :TX, net_amount:  44.80 ],
  [id: 127, ship_to: :NC, net_amount:  25.00 ],
  [id: 128, ship_to: :MA, net_amount:  10.00 ],
  [id: 129, ship_to: :CA, net_amount: 102.00 ],
  [id: 130, ship_to: :NC, net_amount:  50.00 ]
]

IO.inspect Orders.add_totals(tax_rates, orders)
