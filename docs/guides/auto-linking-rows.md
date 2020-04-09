---
layout: default
title: rails_table_for
---

# Auto-linking Rows

With the last example, we displayed a link for each row by passing a block to the `column` method
and using `link_to`.  This is a whole lot of extra code for something so simple.  Let's see how we
can do something similar in a single line:

```
<%=
table_for @records do |table|
  table.column :name, auto_link: true
end
%>
```

This will generate the following HTML:

```html
<table>
  <thead>
    <tr>
      <th>Name</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="/records/1">Austin Roos</a></td>
    </tr>
  </tbody>
</table>
```

You can also pass a block to `column` still, whatever value you return will be placed inside
the anchor tag

If no route can be found for the record, a `NoMethodError`  will be thrown.

Now that we've simplified the linking, we should move on to some more features to make the table
more user-friendly.  It's likely that some collections are going to be much too large to display
on a single page, so let's try out [pagination](./pagination)
