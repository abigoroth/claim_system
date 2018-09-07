class RemoveDocumentFromExpenseEntry < ActiveRecord::Migration[5.2]
  def change
    remove_column :expense_entries, :document, :string
  end
end
