# Wate-me-not Terminal App

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

```bash
~/terminal-app/bin/setup
```

1. Open your .bash_profile in a text editor

1. Add this line

```bash
export PATH=$PATH:$HOME/terminal-app/bin
```

1. Restart your terminal to make sure .bash_profile loads the app into your PATH

1. Run the bookmarks executable to start the app

```bash
terminal
```

## Software Development Plan

### Purpose and scope of the app

## Purpose and scope
Food waste is a huge environmental and economic problem in Australia and across the globe.

#### WHAT is this problem?
According to Nutrition Australia:
National level:
- 7.5 million tonnes wasted
- 3.2 million tonnes of waste goes to landfill
Household level:
- 1 in 5 food items bough is wasted
- 50% garbage produced from households is food waste

[](img) https://nutritionaustralia.org/

#### WHY is this a problem?

Environmental cost:
- Food in landfill rots anaerobically producing methane
- Uses resources (water, energy, fossil fuels) to produce and transport food
Economical cost:
-	$3800 per year per household
-	$20 billion nationally
-	$990 billion globally
Social injustice:
-	5 millions Australians experienced food insecurity last year
-	Globally ¼ of food waste is enough to feed everyone who is undernourished (~ 900million people). 

#### HOW the app can help

The app is designed to provide inspiration and ideas to people on how they can use the food they already have in their fridge/pantry rather than throwing it out. It holds a database of recipes and allows people to search the recipe databased for on one or multiple ingredients that they want to “use up”. Users can add and delete recipes from the database.

#### WHO could use the app abd how?

The app is designed for people with:
-	food they want to use up and staple ingredients such as oil, salt
-	the ability to follow a recipe
-	basic cooking equipment
-	basic IT skills and infrastructure including terminal, keyboard, mouse

The app is designed to provide inspiration on recipes to the user based on an ingredient but does not currently include the full recipe. It is assumed the user can then perform an internet search for the recipe they want. A future feature to add would be the link to a website or even the full recipe in the database. 


### Features


### User Interaction

The following flowchart shows the user interaction with the 

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