class CreatePeopleTable < ActiveRecord::Migration[7.0]
  TABLE = :people

  def up
    return nil if table_exists?(TABLE)

    enable_extension 'pgcrypto'

    create_table(TABLE) do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :age
      t.timestamps
    end
  end

  def down
    return nil if table_exists?(TABLE)

    drop_table(TABLE)
  end
end
