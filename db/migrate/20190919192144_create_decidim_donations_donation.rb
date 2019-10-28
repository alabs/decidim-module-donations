# frozen_string_literal: true

class CreateDecidimDonationsDonation < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_donations_donations do |t|
      t.float :amount, default: 0.0
      t.string :token
      t.string :payer_id
      t.string :email, default: ""
      t.integer :decidim_component_id
      t.jsonb :payload, default: {}
    end
  end
end
