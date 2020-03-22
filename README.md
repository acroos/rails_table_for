# RailsTableFor

[![Gem Version][GV img]][Gem Version]

HTML tables for ActiveRecord collections, made simple

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_table_for'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_table_for

## Usage

In a view in your rails project:
```ruby
<%= table_for @records, columns: [:field_one] do |table| %>
  <% column :field_two %>
  <% column :field_three, title: 'Custom Title' %>
  <% column title: 'Custom Value' do |record| %>
    <% "Field four equals: #{record.field_four}" %>
  <% end %>
<% end %>
```

## Development

- to install dependencies: `bundle install`
- to run tests: `bundle exec rake` (or `rake test`)
- to build local `.gem` file: `bundle exec rake build`
- to install gem on your machine: `bundle exec rake install`
- to bump the version: `bundle exec bump (patch|minor|major)`
- to release: `bundle exec rake release`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/acroos/rails_table_for.

[Gem Version]: https://rubygems.org/gems/rails_table_for
[GV img]: https://badge.fury.io/rb/rails_table_for.png
