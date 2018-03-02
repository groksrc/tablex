# Tablex

Tablex helps you export an existing database into Ecto Schema files.

## Getting Started
It's as easy as 1. 2. 3.

1. `$ git clone git@github.com:groksrc/tablex.git`
2. Edit the config/dev.exs to point to your database
3. `$ mix phx.server`

## Customizing the output
The main idea with this is that it should be easy to customize the output to suit your needs.

There are two places you can do this:

* `lib/tablex_web/views/home_view.ex` # use to modify the `field` outputs
* `lib/tablex_web/templates/home/schema.html.eex` # use to modify the outer parts of the file

## Notes

This tool was intended primarily as an initial introduction for myself with Elixir and Phoenix. As such:

* Relationships are not supported, but could probably be added by someone who is interested (my existing database is from rails and there are no foreign keys).
* I was primarily concerned with creating a starting point for schema files of a large database, not getting them perfect. Edit the files as you see fit.
* I have sub-experimented with [Vuetify.js](vuetifyjs.com) for the front end. There is a little quirk where the left nav will disappear if your window is sized too small which I am not interested to fix. If you don't see the left nav just expand your window until the breakpoint shows it.
