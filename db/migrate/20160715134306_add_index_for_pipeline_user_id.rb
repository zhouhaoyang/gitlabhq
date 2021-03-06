class AddIndexForPipelineUserId < ActiveRecord::Migration
  include Gitlab::Database::MigrationHelpers

  DOWNTIME = false

  disable_ddl_transaction!

  def up
    add_concurrent_index :ci_commits, :user_id
  end

  def down
    remove_index :ci_commits, :user_id if index_exists? :ci_commits, :user_id
  end
end
