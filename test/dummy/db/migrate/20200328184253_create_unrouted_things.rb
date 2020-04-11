# frozen_string_literal: true

class CreateUnroutedThings < ActiveRecord::Migration[6.0]
  def change
    create_table :unrouted_things, &:timestamps
  end
end
