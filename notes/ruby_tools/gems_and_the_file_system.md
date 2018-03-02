# Gems and The Filesystem

#### What are Gems?

> A Ruby gem - also just called a *gem* - is a package of code that you can **download, install and use** in your Ruby programs

*There thousands of gems. Here's som examples:*

* `rubocop` : This Gem checks for Ruby style guide violations and other potential issues in your code.
* `pry` : This Gem helps debug Ruby programs.
* `sequel` : This Gem provides a set of classes and methods that simplify database access.
* `rails` : This Gem provides a web application framework that simplifies and speeds web applications development.

#### Installing Gems

Installing gems are quite simple: 

* You can search the [RubyGems](https://rubygems.org/) website to find a gem you want to install.
* You can then install it with the `gem install *GEM_NAME` command
* Once installed you can usually use the gem immediately - you may have to read some documentation first 

#### Gems and Your File System

> You sometimes need to determine where `gem` puts things on your system. For example, you may need to look at the source code to better understand how a Gem works. You may also need to diagnose a problem with a Gem not working as expected.

Every Ruby version has it's own `gem` command.

Run `gem env (or environment)` to see more information on your current setup:

```Bash
simondein$ gem environment
=>
RubyGems Environment:
  - RUBYGEMS VERSION: 2.6.12
  - RUBY VERSION: 2.4.0 (2016-12-24 patchlevel 0) [x86_64-darwin16]
  - INSTALLATION DIRECTORY: /Users/simondein/.rvm/gems/ruby-2.4.0
  - USER INSTALLATION DIRECTORY: /Users/simondein/.gem/ruby/2.4.0
  - RUBY EXECUTABLE: /Users/simondein/.rvm/rubies/ruby-2.4.0/bin/ruby
  - EXECUTABLE DIRECTORY: /Users/simondein/.rvm/gems/ruby-2.4.0/bin
	...(more info - shortened for brevity)
  - REMOTE SOURCES:
     - https://rubygems.org/
  - SHELL PATH:
     - /Users/simondein/.rvm/gems/ruby-2.4.0/bin
     - /Users/simondein/.rvm/gems/ruby-2.4.0@global/bin
     - /Users/simondein/.rvm/rubies/ruby-2.4.0/bin
	...(more info)
```

###### RUBY VERSION

This is the version number of the Ruby associated with the `gem` command you just ran. Each version of Ruby on your system has its own `gem`command; if you have multiple versions of Ruby installed, then you have multiple versions of `gem` installed. Checking the RUBY VERSION is a helpful diagnostic: if you see an unexpected version, you are likely using the wrong version of `gem` or `ruby`.

###### RUBY EXECUTABLE

This is the location of the `ruby` command that you should use with the Gems managed by this `gem` command. This information is often useful when RUBY VERSION reveals a `gem`/`ruby` mismatch.

###### INSTALLATION DIRECTORY

This directory is where `gem` installs Gems by default. Note that the location varies based on the Ruby version number (`2.2.4` here). (Under rbenv, you may see two different versions in this name: the first is the major version, the second is the actual version. You can usually ignore the major version.)

Let's look at this structure visually. Note that the following shows the directory structure under RVM; the structure will be different but similar with rbenv or a system ruby. The below diagram shows a RVM-managed Ruby version 2.2.4, with the `bundler`, `freewill`, `pry`, and `rubocop`gems installed.

*Visual representation of the gem installation directory:* 

```bash
$ tree /usr/local/rvm      # Example path for developers using rvm installed rubies
/usr/local/rvm
├── gems
│   └── ruby-2.2.4        # This is the INSTALLATION DIRECTORY for Gems for Ruby 2.2.4
│       ├── bin			  # This is the directory for installed executables
│       │   ├── bundle
│       │   └── rubocop
│       └── gems
│           ├── bundler-1.12.5
│           ├── freewill-1.0.0
│           │   └── lib	# Every gem has this directory (only shown here for brevity)
│           │       └── freewill.rb # The actual code loaded when you 'require' a gem
│           ├── pry-0.10.4
│           └── rubocop-0.43.1
└── rubies
    └── ruby-2.2.4
        └── bin
            ├── gem
            ├── irb
            └── ruby	  # This is the EXECUTABLE for Ruby 2.2.4
```

> Inside each Gem-specific directory, you will find additional subdirectories and files. For example, we show a bit of detail for the `freewill` 1.0.0 Gem in Figure 1. The `lib` subdirectory is the most important: this is where your Ruby finds the `require` files for the Gem. For instance, when you write `require 'freewill'` in a program, Ruby loads `freewill.rb` from this `lib` subdirectory. Note that the Gems are installed within a specific Ruby version; in this way, it's possible to install the same Gem for multiple Rubies because they are installed under the Ruby version-specific directory.

###### EXECUTABLE INSTALLATION DIRECTORY

Some Gems provide commands that you can use directly from a terminal prompt; `gem` places those commands in this directory. In Figure 1, we show the `bundler` and `rubocop` executables for Ruby 2.2.4 in the `bin` subdirectory.

Note that you need to include this directory in your shell `PATH`variable so that the shell can find these commands. Your Ruby version manager (rbenv or RVM) usually handles this, but it's useful to know where to look if you have problems. (See also SHELL PATH below.)

###### REMOTE SOURCES

This is the remote library used by this `gem` installation.

###### SHELL PATH

A list of the directories in your shell `PATH` variable. If you are having problems with `command not found` messages or running the wrong versions of programs, this listing may provide valuable clues about where the system looks for your programs.

Note in particular that the list of directories includes `/usr/local/rvm/rubies/ruby-2.2.4/bin`. We can see from Figure 1 that this directory contains the `ruby`, `irb`, and `gem` commands (it contains other commands as well).

If you don't remember what the `PATH` is or how to set it, please take some to review the chapter on the environment in our [Introduction to the Command Line](https://launchschool.com/books/command_line/read/environment) book.

#### Which File Was Required?

When you require gems in your programs - the program tries to locate and load the `../rvm/gems/*name_of_gem/lib/*name_of_gem.rb` file. But sometimes you'll run into an *error that the feature you're trying to load "doesn't exist"* 

To determine the exact file that you loaded to your program you can search the `$LOADED_FEATURES` array for the file. You can do that by inserting `puts $LOADED_FEATURES.grep(/the_file_name\.rb/)` and Ruby will print out any entries in the path with a matching name.

*Example:*

```ruby
puts $LOADED_FEATURES.grep(/the_file_name\.rb)
```

Will output something like:

```bash
/usr/local/rvm/gems/ruby-2.2.4/gems/freewill-1.0.0/lib/the_file_name.rb
```

And from this we can then determine if the correct version was loaded.



### Summary

* Gems are packages of code you can install, require and use in your code
  * Info on your current gem environment can be output with the `gem environmnet` command
  * Each gem belongs to a Ruby version