class DeleteAgeColumn < ActiveRecord::Migration[7.0]
  TABLE  = :people
  COLUMN = :age
  TYPE   = :integer

  def up
    return nil unless table_exists?(TABLE)
    return nil unless column_exists?(TABLE, COLUMN)

    remove_column(TABLE, COLUMN)
  end

  def down
    return nil unless table_exists?(TABLE)
    return nil if column_exists?(TABLE, COLUMN)

    add_column(TABLE, COLUMN, TYPE)
  end
end
