# Bookmarking Terminal App

## GitHub
https://github.com/bronwyncarr/terminal_app

## Installation and Setup
1. Install ruby, we recommend using [asdf](https://asdf-vm.com/)

1. Install git, go to the [official docs](https://git-scm.com/downloads) for more information.

1. `git clone` the app to your home directory

```bash
git clone https://github.com/bronwyncarr/terminal_app ~/terminal-app
```

1. Run the setup executable file

~/terminal-app/bin/setup

1. Open your .bash_profile in a text editor

Add this line

export PATH=$PATH:$HOME/terminal-app/bin

1. Restart your terminal to make sure .bash_profile loads the app into your PATH

Run the bookmarks executable to start the app

bookmarks
Software Development Plan
Features
Outline of User Interaction
The user can learn about how to interact with the app using the help options
They can also see all the available functions of the app via the menu, the menu is using the tty-prompt gem to ensure it's legible and much easier to use instead of just taking in raw user input
Error are handled with control flow
An example of error handling is...
Project Management
I used Trello to manage the different tasks that needed to be done.

Here is a link to my board.

Diagram
Tests
Here is a link to my testing spreadsheet.

If you use RSpec you can say...

To run tests run:

rspec spec