class CreateNoteReactions < ActiveRecord::Migration[5.2]
  
  # Todo: Check if we need indexes here
  # Helpful: https://ducktypelabs.com/when-is-indexing-in-a-model-appropriate/
  # Run a migration with: rake db:migrate
  
  def change
    create_table :note_reactions, id: :uuid do |t|
      t.references :user, foreign_key: true, type: 'uuid'
      t.string :course_slug, null: false
      t.string :lesson_slug, null: false
      t.string :type, null: false
      t.index %i[user_id course_slug lesson_slug], unique: true
      t.timestamps
    end
  end
end



