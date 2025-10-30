class CreateJoinTableNotesTasks < ActiveRecord::Migration[8.1]
  def change
    create_join_table :notes, :tasks do |t|
      t.index [:note_id, :task_id] # rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
      t.index [:task_id, :note_id] # rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
    end
  end
end
