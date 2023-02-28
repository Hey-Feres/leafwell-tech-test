class AddCompletedOnboardingToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :completed_onboarding, :boolean, default: false
  end
end
