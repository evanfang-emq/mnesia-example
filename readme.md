# Mnesia

## Start 2 nodes with Mnesia Example
```sh
# Start node 1 with mnesia
erl -sname node1 -mnesia dir '"db/node1/Mnesia.Company"'

# Start node 2 with mnesia
erl -sname node2 -mnesia dir '"db/node2/Mnesia.Company"'

# In node 1 REPL:
# Compile 
c(company).

# Create schema
# Remind: replace @evandeAir with your machine name
company:create_schema([node1@evandeAir, node2@evandeAir]).

# Start mnesia
mnesia:start().

# In node 2 REPL:
# Start mnesia
mnesia:start().

# Create table
company:create_table([node1@evandeAir, node2@evandeAir]).

# Insert employee
company:insert_emp().

# In node 1 REPL:
# Get employee
company:get_emp().
```

## References:
- [Starting Mnesia for the First Time](https://erlang.org/doc/apps/mnesia/Mnesia_chap2.html#starting-mnesia-for-the-first-time)
- [Mnesia And The Art of Remembering](https://learnyousomeerlang.com/mnesia#access-and-context)
