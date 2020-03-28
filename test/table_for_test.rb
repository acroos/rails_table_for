# require 'test_helper'
# require 'rails_table_for/table_helper'
# require 'byebug'
 
# class TableForTest < ActiveSupport::TestCase
#   include TableHelper
#   def test_one
#     user1 = users :one
#     byebug
#     10.times { User.create! }
#     users = User.all
#     html = table_for(users) do |table|
#       table.column :id, auto_link: true
#     end
#   end
# end