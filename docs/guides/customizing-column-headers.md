---
layout: default
title: rails_table_for
---

# Customizing Column Headers

A one-line table is a delight, but we're a bit limited by only getting values and headers directly from our models.
Let's start by customizing the column header.  The `table_for` method accepts a block with a single `Table` argument.
This object has a single method (`.column`) that allows you some customization.  You can use it like this:

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
      <td>Austin Roos</td>
    </tr>
    ...
  </tbody>
</table>
```

So... we've got a pretty simple table here with our header in Dutch... there must be more right?  Indeed, next let's see
how to do more than print out values directly off the model.  Move on to [customizing row values](./customizing-row-values)