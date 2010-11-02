class CreateNewsletterSignups < ActiveRecord::Migration
  def self.up
    create_table :newsletter_signups do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :exported, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_signups
  end
end
