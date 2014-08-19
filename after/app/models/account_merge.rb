class AccountMerge < ActiveType::Object

  attribute :source_id, :integer
  attribute :target_id, :integer

  validates :source_id, presence: true
  validates :target_id, presence: true

  belongs_to :source, class_name: 'Account'
  belongs_to :target, class_name: 'Account'

  after_save :transfer_credits
  after_save :transfer_subscriptions
  after_save :destroy_source
  after_save :send_notification

  private
    def transfer_credits
      target.update_attributes!(credits: target.credits + source.credits)
    end

    def transfer_subscriptions
      source.subscriptions.each do |subscription|
        subscription.update_attributes!(account: target)
      end
    end

    def destroy_source
      source.destroy
    end

    def send_notification
      AccountMailer.account_merge_notification(source, target).deliver
    end
end
