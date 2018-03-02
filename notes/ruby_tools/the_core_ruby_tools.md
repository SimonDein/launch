# The Core Ruby Tools

 *This list should serve as a brief overview of the core ruby tools as to my current understanding*



* #### Version Manager

  * ##### RVM

    * With RVM we can have multiple versions of Ruby "living together" we can easily switch between depending on project and specications thereof.
    * A big benefit to using a version manager is **you don't need root access** each time you want to change your environment

- #### Programming Language

  - ##### Ruby-2.4.0 (example)

    - ###### Core Library

      - Always accessible to your program

    - ###### Standard Library

      - **Has to be** `required` / loaded
      - Where the very specific / unique classes, modules and functionality live

    - ###### Executables

      - `gem`
      - `irb`
      - `rake`

- #### Dependancy Manager

  - ##### Bundler

    - A dependancy manager like bundler makes it very easy to work on several projects with different dependancies and specifications on the same system (computer).
    - Bundler takes care of removing every gem and gem version from `$LOAD_PATH` and only **loads the specified dependancies to avoid conflicts**.
    - Dependancies are defined in a `Gemfile` and calling `bundle install` will install any missing gems and dependancies and produce a `Gemfile.lock`
    - Bundler uses the `Gemfile.lock` to load the correct gems, and versions thereof, for the program (see bullet point 2)

- #### Task Management and Build Automation

  - ##### Rake

    - A task manager like Rake is a utility that is used for making repetetive and combersome tasks  like running tests, resetting datebases and packaging software simple and less repetetive.
    - Tasks are defined in a `Rakefile` and can then be called as simple commands

I've reported this as a "bug" though it's not really.

In the "Setting Local Rubies" section you advise us to use a `.ruby-version` file per project to have RVM automatically switch versions upon entering a project. Thereafter you also advise us to create a `.ruby-version` file in our systems home directory so that any time we're not in a project containgin