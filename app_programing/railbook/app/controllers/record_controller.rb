class RecordController < ApplicationController
  def find
    @books = Book.find([2, 5, 10])
    # @books = Book.find(2, 5, 10)
    render 'hello/list'
  end

  def find_by
    @book = Book.find_by(publisher: '技術評論社')
    render 'books/show'
  end

  def find_by_multi
    @book = Book.find_by(publisher: '技術評論社', price: 3960)
    render 'books/show'
  end

  def where
    @books = Book.where(publisher: '技術評論社')

    # whereメソッドでのさまざまな条件式
    # @books = Book.where(publisher: '技術評論社', price: 3520)
    # @books = Book.where(published: '2024-01-01'..'2024-12-31')
    # @books = Book.where(publisher: ['技術評論社', '翔泳社'])
    # @books = Book.where(price: 3500..)
    # @books = Book.where(price: 3500..Float::INFINITY)
    render 'hello/list'
  end

  def where_or
    @books = Book.where(publisher: '技術評論社').or(Book.where(price: 3000..))
    # 以下は、互換性エラーとなる
    # @books = Book.where(publisher: '技術評論社').or(Book.where(price: 3000..).limit(1))
    render 'hello/list'
  end

  def where_tuple
    @books = Book.where([:publisher, :dl] =>
      [['技術評論社', true], ['日経BP', false]])
    render 'hello/list'
  end

  def ph1
    @books = Book.where('publisher = ? AND price >= ?',
      params[:publisher], params[:price])
    render 'hello/list'
  end

  # 名前付きパラメーターで書き換え
  # def ph1
  #  @books = Book.where('publisher = :publisher AND price >= :price',
  #    publisher: params[:publisher], price: params[:price])
  #  render 'hello/list'
  # end

  def not
    @books = Book.where.not(isbn: params[:id])
    render 'hello/list'
  end

  def excluding
    @reviews = Review.excluding(Book.find(1).reviews)
    render 'reviews/index'
  end

  def order
    @books = Book.where(publisher: '技術評論社').order(published: :desc)
    # @books = Book.where(publisher: '技術評論社').order(published: :desc, price: :asc)

    render 'hello/list'
  end

  def reorder
    @books = Book.order(:publisher).order(:price)
    # @books = Book.order(:publisher).reorder(:price)
    # @books = Book.order(:publisher).reorder(nil)
    render 'hello/list'
  end

  def in_order
    @books = Book.in_order_of(:publisher, %w(技術評論社 翔泳社 SBクリエイティブ 日経BP 森北出版))
    render 'hello/list'
  end

  def select
    @books = Book.where(price: 4000..).select(:title, :price)
    render 'hello/list'
  end

  def select2
    @pubs = Book.select(:publisher).distinct.order(:publisher)
    # @pubs = Book.select(:publisher).distinct.distinct(false)
  end

  def offset
    @books = Book.order(published: :desc).limit(3).offset(4)
    render 'hello/list'
  end

  def page
    page_size = 3
    page_num = params[:id] == nil ? 0 : params[:id].to_i - 1
    @books = Book.order(published: :desc).limit(page_size).offset(page_size * page_num)
    render 'hello/list'
  end

  def last
    @book = Book.order(published: :desc).last
    render 'books/show'
  end

  def groupby
    @books = Book.select('publisher, AVG(price) AS avg_price').group(:publisher)
  end

  def havingby
    @books = Book.select('publisher, AVG(price) AS avg_price').group(:publisher).
      having('AVG(price) >= ?', 3500)
    render 'record/groupby'
  end

  def where2
    @books = Book.all
    @books.where!(publisher: '技術評論社')
    @books.order!(:published)

    # @books = @books.where(publisher: '技術評論社')
    # @books = @books.order(:published)
    render 'hello/list'
  end

  def unscope
    @books = Book.where(publisher: '技術評論社').order(:price)
      .select(:isbn, :title).unscope(:where, :select)
    render 'hello/list'
  end

  def unscope2
    @books = Book.where(publisher: '技術評論社', dl: true).order(:price)
      .unscope(where: :dl)
    render 'hello/list'
  end

  def none
    case params[:id]
      when 'all'
        @books = Book.all
      when 'new'
        @books = Book.order('published DESC').limit(5)
      when 'cheap'
        @books = Book.order(:price).limit(5)
      else
        @books = Book.none
    end
    render 'hello/list'
  end

  def pluck
    render plain: Book.where(publisher: '技術評論社').pluck(:title, :price)
  end

  def pick
    render plain: Book.order(published: :desc).pick(:title)
  end

  def exists
    flag = Book.where(publisher: '新評論社').exists?
    # flag = Book.exists?(1)
    # flag = Book.exists?(['price > ?', 5000])
    # flag = Book.exists?(publisher: '技術評論社')
    # flag = Book.exists?
    render plain: "存在するか？ : #{flag}"
  end

  def scope
    @books = Book.gihyo.top10
    render 'hello/list'
  end

  def scope2
    @books = Book.whats_new('技術評論社')
    render 'hello/list'
  end

  def def_scope
    @reviews = Review.all
    render 'reviews/index'
  end

  def count
    cnt = Book.where(publisher: '技術評論社').count
    # cnt = Book.count
    # cnt = Book.count(:publisher)
    # cnt = Book.distinct.count(:publisher)

    render plain: "#{cnt}件です。"
  end

  def average
    price = Book.where(publisher: '技術評論社').average(:price)
    render plain: "平均価格は#{price}円です。"

    # 非同期化
    # price = Book.where(publisher: '技術評論社').async_average(:price)
    # render plain: "平均価格は#{price.value}円です。"
  end

  def create
    # book = Book.new
    # book.isbn = '978-4-297-14244-5'
    # book.title = '［改訂第3版］C#ポケットリファレンス'
    # book.price = 3520
    # book.publisher = '技術評論社'
    # book.published = '2024-06-21'
    # book.dl = true
    # book.save

    book = Book.create(isbn: '978-4-297-14244-5',
      title: '［改訂第3版］C#ポケットリファレンス', price: 3520, publisher: '技術評論社', published: '2024-06-21', dl: true)
    render plain: '登録しました。'
  end

  def update
    book = Book.find(1)
    # book.title = 'MySQL入門 第2版'
    # book.price = 3000
    # book.published = '2027-06-21'
    # book.save

    book.update(title: 'MySQL入門 第2版', price: 3000,
      published: '2027-06-21')
    render plain: '更新しました。'
  end

  def groupby2
    @books = Book.group(:publisher).average(:price)
  end

  def literal_sql
    @books = Book.find_by_sql(['SELECT publisher, AVG(price) AS avg_price FROM "books" GROUP BY publisher HAVING AVG(price) >= ?', 3500])
    render 'record/groupby'
  end

  def insert_all
    @books = Book.insert_all([
      { isbn: '978-4-297-13919-9', title: '3ステップで学ぶ Ruby入門', price: 2860,
        publisher: '技術評論社', published: '2024-07-30', dl: true },
      { isbn: '978-4-999-24521-0', title: '速習 Rails', price: 1000,
        publisher: 'WINGS', published: '2024-08-31', dl: true}
    ], record_timestamps: true)
    render plain: @books.to_a
  end

  def upsert_all
    @books = Book.upsert_all([
      { isbn: '978-4-297-13919-9', title: '3ステップで学ぶ Ruby入門', price: 3000,
        publisher: '技術評論社', published: '2024-07-30', dl: true },
      { isbn: '978-4-297-13919-9', title: 'はじめてのRuby入門', price: 2900,
      publisher: '技術評論社', published: '2024-07-30', dl: true },
      { isbn: '978-4-888-254321-0', title: '速習 Rails 7', price: 1000,
        publisher: 'WINGSプロジェクト', published: '2024-08-31', dl: true}
    ],  unique_by: :isbn, record_timestamps: true)
    render plain: '更新完了'
  end

  def update_all
    cnt = Book.where(publisher: '技術評論社').update_all(publisher: 'Gihyo')
    render plain: "#{cnt}件のデータを更新しました。"
  end

  def update_all2
    cnt = Book.order(:published).limit(5)
      .update_all('price = price * 0.8')
    render plain: "#{cnt}件のデータを更新しました。"
  end

  def normalizes
    user = User.find(1)
    user.update(email: '   HOGE@EXAMPLE.COM   ');
    render plain: user.email
  end

  def normalizes2
    @user = User.find_by(email: "\tHOGE@EXAMPLE.com\n")
    render 'users/show'
  end

  def del
    Book.destroy(1)
    # Book.delete(1)
    render plain: '削除しました。'
  end

  def destroy_all
    Review.where(book: 1).destroy_all
    # Review.destroy_by(book: 1)
    render plain: '削除完了'
  end

  def transact
      Book.transaction do
        b1 = Book.new({isbn: '978-4-297-13062-6',
          title: 'Rails 7ポケットリファレンス',
          price: 2580, publisher: '技術評論社', published: '2017-04-17'})
        b1.save!
        raise '例外発生：処理はキャンセルされました。'
        b2 = Book.new({isbn: '978-4-297-13062-7',
          title: 'Rubyポケットリファレンス',
          price: 2500, publisher: '技術評論社', published: '2024-09-10'})
        b2.save!
      end

      # 分離レベルを設定した場合
      # Book.transaction(isolation: :read_uncommitted) do
      #  @book = Book.find(1)
      #  @book.update(price: 3000)
      # end

      render plain: 'トランザクションは成功しました。'
    rescue => e
      render plain: e.message
  end

  def enum_rec
    @review = Review.find(1)
    @review.published!
    # @review.status = 1
    # @review.status = :published

    render plain: "ステータス：#{@review.status}"
    # render plain: "ステータス：#{Review.statuses[@review.status]}"
  end

  def enum_scope
    @reviews = Review.published
    # @reviews = Review.published.where('updated_at > ?', 6.months.ago)
    # @reviews = Review.not_published
    render 'reviews/index'
  end

  def keywd
    @search = SearchKeyword.new
  end

  def keywd_process
    @search = SearchKeyword.new(params.require(:search_keyword).permit(:keyword))

    if @search.valid?
      render plain: @search.keyword
    else
      render plain: @search.errors.full_messages[0]
    end
  end

  def belongs
    @review = Review.find(1)
  end

  def hasmany
    @book = Book.find_by(isbn: '978-4-297-13919-3')
  end

  def hasone
    @user = User.find_by(username: 'yyamada')
  end

  def has_and_belongs
    @book = Book.find_by(isbn: '978-4-7981-8094-6')
  end

  def has_many_through
    @user = User.find_by(username: 'isatou')
  end

  def cache_counter
    @user =User.find(1)
    render plain: @user.reviews.size
  end

  def memorize
    @book = Book.find(1)
    @memo = @book.memos.build({ body: 'あとで買う' })
    if @memo.save
      render plain: 'メモを作成しました。'

    else
      render plain: @memo.errors.full_messages[0]
    end
  end

  def show_memo
    @book = Book.find(1)
    render plain: @book.memos[0].body

    # @memo = Memo.find(1)
    # render plain: @memo.memoable.title
  end

  def create_animals
    Dog.create(name: 'ハナ', gender: 'female')
    Cat.create(name: 'サクラ', gender: 'female')
    Hamster.create(name: 'マメ', gender: 'male')
    render plain: 'データを作成しました。'
  end

  def show_animals
    @animals = Animal.all
  end

  def create_entries
    Entry.create!(name: '佐藤理央', entryable:
      Note.new(header: 'X記事サンプル検証', text: 'Windows／macOS双方で確認'))
    Entry.create!(name: '鈴木太郎', entryable:
      Comment.new(body: 'B記事の査読完了'))
    Entry.create!(name: '山田花子', entryable:
      Note.new(header: 'Y企画構成案', text: '6月30日までに提出'))
    Entry.create!(name: '藤井次郎', entryable:
      Comment.new(body: 'A書籍の見本誌送付済'))
    render plain: 'データを作成しました。'
  end

  def delegate_list
    @entries = Entry.all
  end

  def missing
    @users = User.where.missing(:author)
    # @users = User.where.associated (:author)
    render 'users/index'
  end

  def associated
    @reviews = Book.where(publisher: '技術評論社').extract_associated(:reviews)
  end

  def assoc_join
    @books = Book.joins(:reviews, :authors).
     order('books.title, reviews.updated_at').
     select('books.*, reviews.body, authors.name')
  end

  def assoc_join2
  @books = Book.joins(reviews: :user).
     select('books.*, reviews.body, users.username')
  end

  def assoc_join_left
    @books = Book.left_outer_joins(:reviews).select('books.*, reviews.body')
    # @books = Book.joins('LEFT OUTER JOIN reviews ON reviews.book_id = books.id').
    # select('books.*, reviews.body')
  end

  def assoc_includes
    @books = Book.includes(:reviews).all
    # @books = Book.all
  end

  def attr
    @book = Book.find(1)
    render plain: @book.price.class
  end
end
