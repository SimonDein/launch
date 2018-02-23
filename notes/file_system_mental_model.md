# File System Mental Model

> My current understanding of the filesystem structure in relation to Ruby, it's utilites and gems.



#### Where Things Live (with RVM)

* **`User/simondein/.rvm`** # root for rubies and gems installed with **rvm**

  * **`rubies`**

    * `ruby-2.4.1`

      * ….

    * `ruby-2.5.0`

      * `bin` # Folder containing all executables that come with this Ruby

        * `gem`

        * `irb`

        * `ruby`  # This is the executable that *carries* the language 

          - Classes

            - `Array`
              - Class methods
                - `Array.something`
              - Instance methods
                - `some_array.push`
              - `arr = Array.new`
                - instance variables
                  - @length


            - `Hash`
            - `Module`
              - Can be `require`d  to provide methods (or as namespace)
            - `Integer`
            - …

  * **`gems` **

    * `ruby-2.4.1`
      * …
    * `ruby-2.5.0`
      * `bin`  # Folder containing the executables for all gems installed under this ruby version
        * `bundler`
        * `rubocop`
        * `pry`
      * `gems`
        * `bundler-1.16.1`
        * `pry-0.10.4`
        * `rubocop-0.46.0`



### Notes 

- Ruber Environment Manager (RVM)
  - With a rvm you can install and switch between several rubies AKA Ruby versions
- Gems
  - Each version of Ruby got it's own gems
  - Several versions of a gem can be installed under the same version
  - Gems can come with executables - these will be located in the`.../.rvm/gems/*ruby_v/bin` folder (where *ruby_v is the folder name of the respective ruby version)
- Dependency manager (Bundler)
  - Takes care of project based dependency issues
  - Provide a `Gemfile` using (very simple) DSL to describe witch version og ruby and gems you wish to use and it will provide a `Gemfile.lock` for your project
  - Include a `require bundler/setup` at the top of your program to load the correct ruby version and gems