class CartService
  attr_reader :data

  def initialize(data)
    # Stores data in format of {:product_id => quantity}
    @data = data || {}
  end

  def add(product, quantity = 1)
    @data[get_id product] ||= 0
    @data[get_id product] += quantity
  end

  def update(product, quantity)
    @data[get_id product] = quantity
  end

  def remove(product)
    @data[get_id product] = nil
  end

  def [](product)
    @data[get_id product]
  end

  def clear
    @data = {}
  end

  protected

  def get_id(k)
    k.kind_of?(Product) ? k.id.to_s : k.to_s
  end
end
