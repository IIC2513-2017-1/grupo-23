class ChangeTableToPublications < ActiveRecord::Migration[5.0]
  def change
    change_column_null :publications, :content, false

  end
end
