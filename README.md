# Vending-Machine

This is the entire workflow that the vending machine implements righ now.

- Import a HTML file and watch it magically convert to Markdown
- Drag and drop images (requires your Dropbox account be linked)

### Usage

> Since this application was built using `ruby` you need to make sure you have it installed. You can follow the [instructions here](https://www.ruby-lang.org/en/documentation/installation/) depending on your operative system.
> It is recommended to use at least `ruby version 2.6.3`.

To run the application first, in your terminal run the following command to clone this repo using the next command:

```sh
$ git clone https://github.com/alexventuraio/vending-machine
```

Then access the folder with:

```sh
$ cd vending-machine/
```

Now, run the entry point of the app with the next command:

```sh
$ ruby vending_machine.rb
```

At this point you will be able to see the main menu of the application in your terminal. Just follow the instructions on the screen to operate the machine.🎉🎉🎉

### To run the test suite

First, you need to make sure you have [RSpec](https://relishapp.com/rspec/docs/gettingstarted) installed. As required above, once you have `ruby` installed, install `RSpec` is pretty straightforward. Just run the following command inside the root folder of the application:

```sh
$ gem install rspec
```

Once your have `RSpec` in your system, you only have to run the following command to run the test suite.

```sh
$ bundle exec rspec
```
