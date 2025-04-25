class SendmailJob < ApplicationJob
  # retry_on MyAppException, wait: 10, attempts: 5

  queue_as :default

  # queue_as do
  #   if Rails.env.production?
  #     :default
  #   else
  #     :dev
  #   end
  # end

  before_enqueue do |job|
    logger.info("before_enqueue #{job.inspect}")
  end

  after_enqueue do |job|
    logger.info("after_enqueue #{job.inspect}")
  end

  around_perform do |job, block|
    logger.info("before_perform #{job.inspect}")
    block.call
    logger.info("after_perform #{job.inspect}")
  end

  def perform(user)
    # raise MyAppException, '例外が発生しました。'
    NoticeMailer.with(user: user).sendmail_confirm.deliver_now
  end
end
