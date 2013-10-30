# Border Patrol

[![Gem Version](https://badge.fury.io/rb/border_patrol.png)](http://badge.fury.io/rb/border_patrol)
[![Build Status](https://travis-ci.org/lbeder/border_patrol.png)](https://travis-ci.org/lbeder/border_patrol)
[![Dependency Status](https://gemnasium.com/lbeder/border_patrol.png)](https://gemnasium.com/lbeder/border_patrol)
[![Coverage Status](https://coveralls.io/repos/lbeder/border_patrol/badge.png)](https://coveralls.io/r/lbeder/border_patrol)

Prevents your Rails server from starting and running, while there are pending DB migrations.

## Setup

If you are using bundler add border_patrol to your Gemfile:

``` ruby
gem 'border_patrol'
```

Then run:

```bash
$ bundle install
```

Otherwise install the gem:

```bash
$ gem install border_patrol
```

## Usage

In order to start using this gem, you'd need to add an initializer in your up:

``` ruby
BorderPatrol.configure do |config|
end if defined?(BorderPatrol)
```

## Configuration
The following parameters are supported:

* **terminate**: whether to terminate running server, when there's a new pending migration (default: false).

## License

The MIT License (MIT)

Copyright (c) 2013

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
