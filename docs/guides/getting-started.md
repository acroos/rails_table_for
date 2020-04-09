---
layout: default
title: rails_table_for
---

# Getting Started

For a simple table displaying some attributes of your ActiveRecord model, simply
call `table_for` with an ActiveRecord collection and an array of columns:

```
<%= table_for @records, columns: [:full_name] %>
```

The columns must correspond to methods/properties on the model class.  The column header
will be the method/property name "humanized" (capitalized, split into words).

Example output:
```html
<table>
  <thead>
    <tr>
      <th>Full Name</th>
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

This is a good start, but surely you'd like to customize things a little bit.   Move on to [customizing columns](./customizing-column-headers)
