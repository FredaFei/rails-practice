# 设置数据库

`database.yml` 设置数据库参数

# 创建数据库
```
bin/rails db:create
```

# 自动重启（Windows）
+ 打开config/environments/development.rb
+ 文件末尾 config.file_watcher 解开注释
+ 打开Gemfile，添加
```
group :development do
  gem 'listen'
  gem 'wdm', '>=0.1.0', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
end
```