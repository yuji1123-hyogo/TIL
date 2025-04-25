class ExtraController < ApplicationController
  def sendmail
    user = User.find(6)
    @mail = NoticeMailer.with(user: user).sendmail_confirm.deliver_now
    render plain: 'メールが正しく送信できました。'
  end

  def set_job
    user = User.find(6)
    SendmailJob.perform_later(user)
    # SendmailJob.set(queue: :my_queue).perform_later(user)
    render plain: '正しく実行できました。'
  end

  def add_file
    @author = Author.find(3)
    @author.photo.attach(io: File.open('tmp/data/wings.jpg'), filename: 'wings.jpg', content_type: 'image/jpeg')
    # @author.photo.attach(params[:photo])
    render plain: "ファイルを追加しました。"
  end

  def model
    @book = Book.find(1)
  end
end
