---
layout: default
title: rails_table_for
---

# Customizing Row Values

It's great that we can change the header on a column displaying a user's name, but we must be able to do more than just show
simple strings from our models in these rows, right?  Right.  You can pass a block to the `Table#column` method and return
anything your heart desires.  Let's add a column that gives us a link to 'Show' the user.

```
<%= 
table_for @records do |table|
  table.column :name, title: 'Naam'
  table.column title: 'Link' { |record| link_to 'Show', record }
end
%>
```

Assuming the route exists to show that record, this will generate HTML like this:

```html
<table>
  <thead>
    <tr>
      <th>Naam</th>
      <th>Link</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Austin Roos</td>
      <td><a href="/records/1">Show</a></td>
    </tr>
  </tbody>
</table>
```

So... this gets us through most of the basics, but let's see if we can do things a little more simply.  Check out
[auto-linking rows](./auto-linking-rows)
