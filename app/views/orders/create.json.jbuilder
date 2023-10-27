if @order.persisted?
  json.form render(partial: "orders/form", formats: :html, locals: {order: Order.new})
  json.inserted_item render(partial: "orders/order", formats: :html, locals: {order: @order})
else
  json.form render(partial: "orders/form", formats: :html, locals: {order: @order})
end
