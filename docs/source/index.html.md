---
title: rails_table_for documentation

toc_footers:
  - <a href='https://rubygems.org/gems/rails_table_for'>View out on Rubygems.org</a>
  - <a href='https://github.com/acroos/rails_table_for'>View on Github</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction

Welcome to the `rails_table_for` documentation.  Here you'll find examples of all features currently available.

# Installation

> Add this line to your application's Gemfile:

```ruby
gem 'rails_table_for'
```

> And then execute:

```ruby
$ bundle
```

`rails_table_for` is distributed as a Ruby gem via rubygems.org.  It has dependencies on [ActiveRecord](https://rubygems.org/gems/activerecord) and [ActionView](https://rubygems.org/gems/actionview), both of which come pre-packaged with [Rails](https://rubygems.org/gems/rails).  The rest of this guide assumes that you've installed this in your Rails application.

# Examples

## The simplest table

> Assuming we have an ActiveRecord collection named @records:

```erb
<%= table_for @records, columns: [:name] %>
```

> The above code returns HTML in the following format:

```html
<table>
  <thead>
    <tr>
      <th>Name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Austin</td>
    </tr>
  </tbody>
</table>
```

If you simply need to access properties/methods on each record, you can create a lovely
table in one line.  Simply pass the records and an array of columns.  The columns should 
correspond to properties/methods on each record.  The property/method name will then be 
"humanized" and used as the header.


### Arguments

The first (and only positional) argument should be an ActiveRecord collection.

The `columns` option can be used to create basic columns direclty accessing data on records


<aside class="notice">
If using this simple form and no <code>columns</code> are given, you'll just get an empty table
</aside>

## Customize Table Headers

```erb
<%= table_for @records do |table| %>
  <% table.column :name, title: 'naam' %>
<% end %>
```

> The above code returns HTML in the following format:


```html
<table>
  <thead>
    <tr>
      <th>naam</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Austin</td>
    </tr>
  </tbody>
</table>
```

To get some customization of the columns, we need to give `table_for` a block.  This block
should accept a single argument `table`, which has a single method available: `column`.

The simplest way to use the `column` method is to pass the property/method as argument 1 
and `title` as an option.  This will result in a custom header, but the same data as the
simplest form shown in the previous example.

<aside class="notice">If <code>title</code> is not given in this form, the result is identical to the previous example</aside>