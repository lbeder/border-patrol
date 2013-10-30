# Border Patrol

[![Gem Version](https://badge.fury.io/rb/border-patrol.png)](http://badge.fury.io/rb/border-patrol)
[![Build Status](https://travis-ci.org/lbeder/border-patrol.png)](https://travis-ci.org/lbeder/border-patrol)
[![Dependency Status](https://gemnasium.com/lbeder/border-patrol.png)](https://gemnasium.com/lbeder/border-patrol)

Prevents your Rails server from starting and running, while there are pending DB migrations.

## Setup

If you are using bundler add border-patrol to your Gemfile:

``` ruby
gem 'border-patrol'
```

Then run:

```bash
$ bundle install
```

Otherwise install the gem:

```bash
$ gem install border-patrol
```

## Usage

In order to start using this gem, you'd need to add an initializer to your app:

``` ruby
BorderPatrol.configure do |config|
  ...
end if defined?(BorderPatrol)
```

## Configuration
The following parameters are supported:

* **terminate**: whether to terminate running server, when there's a new pending migration (default: false).
* **ignore_console**: whether to perform the tests, when running in the console, or ignore it (default: true).
* **polling_period**: pending migration polling time (in seconds). Only relevant if **terminate** was set to true (default: 30 seconds).

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
