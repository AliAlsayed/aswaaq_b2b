# frozen_string_literal: true

class AddPriceCentsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :price_cents, :integer
  end
end
