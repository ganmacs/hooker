# Hooker

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hooker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hooker

## Usage

```ruby
class A
  include Hooker
  after_hooker :test, :after
  before_hooker :test, :before

  def test(str)
    yield("this is test line and received #{str}")
  end

  def before
    p 'this is in before'
  end

  def after
    p 'this is in after'
  end
end

a = A.new
a.test('this') do |s|
  p s
end 
```

* result

```ruby
"this is in before"
"this is test line and received hoge"
"this is in after"
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/hooker/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request