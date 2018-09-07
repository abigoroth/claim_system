class AddDocumentToExpenseEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :expense_entries, :document, :string
  end
end
