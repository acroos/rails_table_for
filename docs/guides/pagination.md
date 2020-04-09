---
layout: default
title: rails_table_for
---

# Pagination (beta)

If you've made it this far, you know how to create some basic tables to present your data
in whatever way you see fit.  Now you're so happy with your table that you want to present
50 million rows.  This... is a little much for a single page.  Enter pagination:

```
<%= table_for @records, columns: [:id, :name], page_size: 10 %>
```

and voila!  you have a table showing only 10 rows per page as well as a set of links beneath
the table to take you to each page

```html
<div>
  <table>
    <thead>
      <tr>
        <th>Id</th>
        <th>Name</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Austin Roos</td>
        <td>1</td>
      </tr>
      ...
    </tbody>
  </table>
  <div class="pagination-links">
    1
    <a href="/users?page=2">2</a>
    <a href="/users?page=3">3</a>
    <a href="/users?page=4">4</a>
    <a href="/users?page=5">5</a>
  </div>
</div>
```

This feature is still in beta and there are some known limitations.

### Known Issues

If there are multiple tables on a single web page, the pages of the table will always be
synced because of the query parameter.

If the number of pages is very large, every pagination link is still shown instead of 
something a bit more elegant like a few pages before and after the current one as well as
a link to first and last page