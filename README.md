# Warp Directory

[![Join the chat at https://gitter.im/kigster/warp_dir](https://badges.gitter.im/kigster/warp_dir.svg)](https://gitter.im/kigster/warp_dir?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](https://travis-ci.org/kigster/warp_dir.svg?branch=master)](https://travis-ci.org/kigster/warp_dir)
[![Code Climate](https://codeclimate.com/github/kigster/warp_dir/badges/gpa.svg)](https://codeclimate.com/github/kigster/warp_dir)

This is a ruby implementation of the tool 'wd' (warp directory), 
[originally written as a zsh module](https://github.com/mfaerevaag/wd) 
by [Markus Færevaag](https://github.com/mfaerevaag).

After finding it very useful, but having to switch to `bash` on occasion, I wanted to have a completely
compatible tool that is well tested, and can be extended to do some more interesting things.

Markus kindly offered a ruby version in a [separate branch of this module](https://github.com/mfaerevaag/wd/tree/ruby),
which served as an inspiration for this gem.

The overall concept comes from the realization that when we work on the command line, we 

 * often have to deal with a limited number of folders at any given time
 * it would be nice to quickly switch between these folders (which we call __warp points__).
 * it should be easy to add, remove, list, and validate warp points
 * everything should require as few characters as possible :) 

Some future extensions could be based on some additional realizations:

 * each folder often represents a project, some of which are managed by `git`
 * eventually we might want to do things across all projects, such as perform group `git pull`, 
   or even `git push` etc.
 
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'warp_dir'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install warp_dir

## Usage

The usage of the tool is a derived superset of the `ZSH`-based inspiration.

```bash
  > wd --help 
  Usage: wd [ show | list | clean | validate | wipe ]          [ flags ] 
         wd [ add  [ -f/--force ] | rm | ls | path ] <point>   [ flags ]
         wd -v/--version
         wd help
         
  Where:
    Flags           -c/--config file    # default is ~/.warprc
                    -q/--quiet          # suppress all output
                    -n/--dry-run        # just display the commands
                    -f/--force          # overwrite if exists
                    -C/--no-color       # do not print color output
                    
  Warp Point Commands:
    add   <point>   Adds the current directory as a new warp point
    rm    <point>   Removes a warp point
    show  <point>   Show the path to the warp point
    ls    <point>   Show files from tne warp point
    path  <point>   Show the path to given warp point
  
  Global Commands:
    show            Print warp points to current directory
    list            Print all stored warp points
    clean           Remove points warping to nonexistent directories
    help            Show this extremely unhelpful text

```

#### Notable Differenc

 * instead of `wd add!` use `wd add -f <point>` (or --force)
 * instead of `wd clean!` use `wd clean`
 * run `wd validate` to see what will be removed by `clean`.

## Future Features

This is what I envision down the road:

```bash
  wd proj                               # add warp point
  wd proj -x/-execute "command"         # pass an arbitrary command to execute, and return back to CWD  

  wd -g/--group group <point1> <point2>, ..., <pointN>
                                        # create a group of several warp points

  # Run an arbitrary command across all, or a group of warp points, until...
  wd -a/--all   [ -g group ] command    # all points are done 
  wd -f/--first [ -g group ] command    # at least one returns non-blank output
  wd -e/--every [ -g group ] command    # at least one returns blank output
  
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. 
You can also run `bin/console` for an interactive prompt that will 
allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 
To release a new version, update the version number in `version.rb`, and 
then run `bundle exec rake release`, which will create a git tag for the 
version, push git commits and tags, and push the `.gem` file 
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kigster/warp_dir.

## Author

<p>&copy; 2016 Konstantin Gredeskoul, all rights reserved.</p>

## License

This project is distributed under the [MIT License](https://raw.githubusercontent.com/kigster/warp_dir/master/LICENSE).
