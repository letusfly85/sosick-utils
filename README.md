# Sosick::Utils

it maintenances sosick models.

## Installation

Add this line to your application's Gemfile:

    gem 'sosick-utils'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sosick-utils

You also have to set env.
export SOSICK_UTILS_HOME=#{your application path}

## Usage

<pre><code>
require 'sosick/utils'

include Sosick::Utils
Sosick::Utils::initialize($mode)
Sosick::Utils::update
</code></pre>

you should chose mode from "development, production, test"

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sosick-utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
