source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.7'

# アプリケーションサーバー
gem 'puma', '~> 4.3'

# Sass(CSSの拡張言語)を使うためのGem
gem 'sass-rails', '~> 5.0'

# アセットパイプラインで使用されるGem
gem 'uglifier', '>= 1.3.0'

# CoffeeScriptを使用するためのGem
# ※CoffeeScriptのコードはJavaScriptのコードに変換される
gem 'coffee-rails', '~> 4.2'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# ページ遷移をAjaxに置き換え、JavaScriptやCSSのパースを省略することで高速化するgem
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# JSON形式のデータを簡単に作成する事が出来るgem
gem 'jbuilder', '~> 2.5'

# ハッシュ関数を提供するGem
# has_secure_passwordで使われる
gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# TZInfoが参照するタイムゾーン情報を提供するgem。
# TZInfoはRubyからタイムゾーン情報を参照し、その情報に基づいて時間をコンバートするためのライブラリ らしい。
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# bootstrapを使用するためのGem
gem 'bootstrap', '~> 4.3.1'

# jQueryを使用するためのGem
gem 'jquery-rails'

# toastrを使用するためのGem
gem 'toastr-rails'


# 開発環境用
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  # Webコンソール
  gem 'web-console', '>= 3.3.0'
end

# テスト環境用
group :test do
  # E2Eテスト用のフレームワーク
  # ※E2Eテスト：システム全体を実稼働時に近い状況で動かして行うテスト
  gem 'capybara', '>= 2.15'

  # ブラウザを自動操作してテストするのに使う
  gem 'selenium-webdriver'

  # RSpecを使用するためのGem
  gem 'rspec-rails', '~> 3.7'

  # chromedriver-helperは2019年3月にサポート終了
  # 作者はwebdriversへの移行を推奨している
  # gem 'chromedriver-helper'
  gem 'webdrivers'
end

# 開発環境＆テスト環境用
group :development, :test do
  # 開発＆テストで使用するDBはsqlite3
  gem 'sqlite3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # FactoryBot：テストデータ作成を支援してくれるGem
  gem 'factory_bot_rails', '~> 4.11'
end

# 本番環境用
group :production do
  # 本番環境で使用するDBはPostgreSQL
  gem 'pg'
end