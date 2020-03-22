---
layout: default
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