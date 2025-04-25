Rails.application.routes.draw do
  draw(:subapp)

  resources :members
  resources :fan_comments
  resources :reviews
  resources :articles
  resources :authors
  resources :users
  resources :books

  # 第7章
  #resource :config

  # resources :books, constraints: { id: /[0-9]{1,2}/ }

  # constraints(id: /[0-9]{1,2}/) do
  #   resources :books
  #   resources :reviews
  # end

  # resources :books, constraints: TimeConstraint.new

  # resources :books, format: false

  # resources :users, controller: :members

  # resources :reviews, as: :comments

  # namespace :admin do
  #   resources :books
  # end

  # scope module: :admin do
  #   resources :books
  # end

  # resources :reviews do
  #   collection do
  #     get :unapproval
  #   end
  #   member do
  #     get :draft
  #   end
  # end

  # resources :reviews do
  #   get :unapproval, on: :collection
  #   get :draft, on: :member
  # end

  # resources :users, except: [ :show, :destroy ]
  # resources :users, only: [ :index, :new, :create, :edit, :update ]

  # resources :reviews, path_names:  { new: :insert, edit: :revise }

  # resources :books do
  #   resources :reviews
  # end

  # resources :books do
  #   resources :reviews, shallow: true
  # end

  # scope shallow_path: :b do
  #   resources :books do
  #     resources :reviews, shallow: true
  #   end
  # end

  # scope shallow_prefix: :b do
  #   resources :books do
  #     resources :reviews, shallow: true
  #   end
  # end

  # concern :additional do
  #   get :unapproval, on: :collection
  #   get :draft, on: :member
  # end

  # resources :reviews, concerns: :additional
  # resources :users, concerns: :additional

  # match '/details(/:id)' => 'hello#index', via: [ :get, :post ]
  # get '/details(/:id)' => 'hello#index'
  # post '/details(/:id)' => 'hello#index'

  # get 'hello/view'
  # get '/articles(/:category)' => 'articles#index', defaults: { category: 'general', format: 'xml' }
  # get 'blogs/:user_id' => 'blogs#index', constraints: { user_id: /[A-Za-z0-9]{3,7}/ }
  # get 'blogs/:user_id' => 'blogs#index', user_id: /[A-Za-z0-9]{3,7}/
  # get '/blogs/:user_id' => 'common/blogs#list'
  # get 'articles' => 'main#index', as: :top
  # get 'articles/*category/:id' => 'articles#category'
  # get '/books/:id' => redirect('/articles/%{id}')
  # get '/books/:id' => redirect {|p, req| "/articles/#{p[:id].to_i + 10000}" }

  root to: 'hello#list'

  get 'routes/direct'

  direct :support do
    'https://wings.msn.to/'
  end

  direct :root do
    { controller: 'hello', action: 'view', anchor: 'hoge' }
  end

  direct :help do |opts|
    uri = URI.parse('https://wings.msn.to/')
    uri.query = opts.to_query unless opts.empty?
    uri.to_s
  end

  direct :reviewed do |model|
    [ model, anchor: model.status ]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # # 第4章
  get 'hello/index'
  get 'hello/list'
  get 'view/keyword'
  post 'view/search'
  post 'view/create'
  get 'view/field'
  get 'view/select'
  get 'view/col_select'
  get 'view/group_select'
  get 'view/dat_select'
  get 'view/week_select'
  get 'view/col_radio'
  get 'view/fields_for'
  get 'view/raw'
  get 'view/simple_format'
  get 'view/truncate'
  get 'view/excerpt'
  get 'view/highlight'
  get 'view/conc'
  get 'view/sanitize'
  get 'view/number_to'
  get 'view/link'
  get 'view/urlfor'
  get 'view/new'
  get 'members/login'
  get 'view/linkif'
  get 'login/index'
  get 'login/info'
  get 'view/current'
  get 'view/detail'
  get 'view/mailto'
  get 'view/capture'
  get 'view/helper'
  get 'view/helper2'
  get 'view/helper3'
  get 'view/adopt'
  get 'view/provide'
  get 'view/multi'
  get 'view/relation'
  get 'view/download'
  get 'view/quest'
  get 'view/nest'
  get 'view/local'
  get 'view/partial_layout'
  get 'view/partial_col'
  get 'view/partial_spacer'

  # 第5章
  get 'record/find'
  get 'record/find_by'
  get 'record/find_by_multi'
  get 'record/where'
  get 'record/ph1/:publisher/:price' => 'record#ph1'
  get 'record/not(/:id)' => 'record#not'
  get 'record/excluding'
  get 'record/where_or'
  get 'record/where_tuple'
  get 'record/order'
  get 'record/reorder'
  get 'record/in_order'
  get 'record/select'
  get 'record/select2'
  get 'record/offset'
  get 'record/page(/:id)' => 'record#page'
  get 'record/last'
  get 'record/groupby'
  get 'record/havingby'
  get 'record/where2'
  get 'record/unscope'
  get 'record/unscope2'
  get 'record/none(/:id)' => 'record#none'
  get 'record/pluck'
  get 'record/pick'
  get 'record/exists'
  get 'record/scope'
  get 'record/scope2'
  get 'record/def_scope'
  get 'record/count'
  get 'record/average'
  get 'record/create'
  get 'record/update'
  get 'record/groupby2'
  get 'record/literal_sql'
  get 'record/insert_all'
  get 'record/upsert_all'
  get 'record/update_all'
  get 'record/update_all2'
  get 'record/normalizes'
  get 'record/normalizes2'
  get 'record/del'
  get 'record/destroy_all'
  get 'record/transact'
  get 'record/enum_rec'
  get 'record/enum_scope'
  get 'record/keywd'
  post 'record/keywd_process'
  get 'record/belongs'
  get 'record/hasmany'
  get 'record/hasone'
  get 'record/has_and_belongs'
  get 'record/has_many_through'
  get 'record/cache_counter'
  get 'record/memorize'
  get 'record/show_memo'
  get 'record/create_animals'
  get 'record/show_animals'
  get 'record/create_entries'
  get 'record/delegate_list'
  get 'record/missing'
  get 'record/associated'
  get 'record/assoc_join'
  get 'record/assoc_join2'
  get 'record/assoc_join_left'
  get 'record/assoc_includes'
  get 'record/attr'

  # 第6章
  get 'ctrl/para(/:id)' => 'ctrl#para'
  get 'ctrl/para_array'
  get 'ctrl/req_head'
  get 'ctrl/req_head2'
  get 'ctrl/double_render'
  get 'ctrl/plain_render'
  get 'ctrl/head_sample'
  get 'ctrl/redirect'
  get 'ctrl/file_send'
  get 'ctrl/data_send'
  get 'ctrl/res_head'
  get 'ctrl/expires'
  get 'ctrl/log'
  get 'ctrl/get_xml'
  get 'ctrl/get_json'
  get 'ctrl/download'
  get 'ctrl/cookie'
  post 'ctrl/cookie_rec'
  get 'ctrl/cookie_del'
  get 'ctrl/session_show'
  post 'ctrl/session_rec'
  get 'ctrl/session_del'
  get 'ctrl/index'
  get 'ctrl/index2'
  get 'login/index'
  post 'login/auth'
  get 'login/logout'
  get 'sample/index'
  get 'ctrl/device'
  get 'hello/view'
  get 'ctrl/tokengen'
  get 'ctrl/tokenby'

  # 第10章
  get 'extra/sendmail'
  get 'extra/set_job'
  get 'extra/add_file'
  get 'messages/index'
  get 'messages/:topic' => 'messages#index'

  # 11章
  get 'extra/f_cache'
  get 'extra/share1'
  get 'extra/share2'
  get 'extra/model'
  get 'extra/model2'
  get 'extra/trans'
  get 'ctrl/trans'

  # ルートパラメータ経由でロケールを変更
  # scope "(:locale)", locale: /ja|en|de/ do
  #   resources :books
  #   get 'extra/trans'
  # end

  # match '/:locale' => 'hello#list', via: [ :get ]

  get 'extra/up_file'
  post 'extra/add_file'
end
