# Itamae::Plugin::Recipe::AndroidSdk

Require JDK.

[![Gem Version](https://badge.fury.io/rb/itamae-plugin-recipe-android_sdk.svg)](https://badge.fury.io/rb/itamae-plugin-recipe-android_sdk)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-android_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-android_sdk

## Usage

#### android_sdk::install

Install Android SDK.

* recipe

```ruby
include_recipe 'android_sdk::install'
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

#### android sdk update

Update Android SDK at like node.json following:

```json
{
  "sdk": {
    ...
    "update_list" : [
      "build-tools-23.0.3",
      "android-22"
    ]
  }
}
```


## License

[MIT License](http://opensource.org/licenses/MIT).
