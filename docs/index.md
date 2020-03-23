---
layout: default
title: rails_table_for
---


# Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_table_for'
```

And then execute:

```
$ bundle
```

# Simple Table

For the simplest table, just pass an ActiveRecord collection and an array of columns
```
<%= table_for @records, columns: [:name] %>
```

The columns must correspond to methods/properties on the record class.  The column header
will be the method/property name "humanized".

Example output:
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

# Customize Column Headers

You can can change the default column headers by passing a block to `table_for` and using the `Table#column` method:

```
<%= table_for @records do |table| %>
  <% table.column :name, title: 'Naam' %>
<% end %>
```

The title of the column will now be `Naam` and the rest of the table will be the same as the first example:
```html
<table>
  <thead>
    <tr>
      <th>Naam</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Austin</td>
    </tr>
  </tbody>
</table>
```

# Pass Blocks to `Table#column`

You can pass a block to the `Table#column` method to display values not directly accessible
from the model's methods/properties:

```
<%= 
table_for @records do |table|
  table.column title: 'Link' do |record|
    link_to record.name, record
  end
end
%>
```

Assuming the route exists to show that record, this will generate HTML like this:

```html
<table>
  <thead>
    <tr>
      <th>Link</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="/records/1">Record 1</a></td>
    </tr>
  </tbody>
</table>
```