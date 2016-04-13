# Itamae::Plugin::Recipe::AndroidSdk


## Installation

※ **Not yet published in 'RubyGems.org'**

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-android_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-android_sdk

## Usage

#### android_sdk::system

Install for shared users.

* recipe

```ruby
include_recipe 'android_sdk::system'
```

* node.json

```json
{
  "sdk": {
    "version" : "r24.4.1",
    "install_path" : "/hoge"
  }
}
```

Default install path `/usr/local`, if not set 'install_path'


## License

[MIT License](http://opensource.org/licenses/MIT).
