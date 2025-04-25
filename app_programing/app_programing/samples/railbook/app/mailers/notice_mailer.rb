class NoticeMailer < ApplicationMailer
  # layout 'mail'

  default from: 'webmaster@example.com',
          cc: 'yyamada@example.com'

  def sendmail_confirm
    @user = params[:user]

    # 添付ファイル付きのメールを送信(File.open)
    # attachments['wings.jpg'] =
    #   File.open(Rails.root.join('tmp/data/wings.jpg'), 'rb').read

    # メールインラインでの添付ファイルを生成
    # attachments.inline['wings.jpg'] =
    #   File.open(Rails.root.join('tmp/data/wings.jpg'), 'rb').read

    mail to: @user.email,
            subject: "#{@user.username}さん、登録ありがとうございました"
            # subject: default_i18n_subject(user: @user.username)

    # headers[:reply_to] = 'hoge@example.com'
    # headers({ reply_to: 'hoge@example.com',  bcc: 'foo@example.com'})

    # メールの出力をカスタマイズ
    # @user = params[:user]
    # mail to: @user.email,
    #   subject: "#{@user.username}さん、登録ありがとうございました" do |format|
    #   format.text { render inline: 'HTML対応クライアントで受信ください' }
    #   format.html
    # end
  end

  def error_mail(address)
    mail to: address,
      subject: 'エラー発生',
      body: 'エラーが発生しました。メールを確認してください'
  end
end
