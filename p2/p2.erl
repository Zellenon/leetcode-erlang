% Solution passes all tests with 0ms runtime (meets or beats 100.00% of
% competitors) and 62.90MB memory (meets or beats 100.00% of competitors)
%
-module(p2).

-export([add_two_numbers/2]).

-record(list_node, {val = 0 :: integer(),
                    next = null :: 'null' | #list_node{}}).

-spec add_two_numbers(L1 :: #list_node{} | null, L2 :: #list_node{} | null) -> #list_node{} | null.
add_two_numbers(L1, L2) ->
    to_list(to_int(L1) + to_int(L2))
  .

to_int(#list_node{next = Next, val = Val}) ->
    to_int(Next) * 10 + Val;
to_int(_) -> 0.

to_list(Total) ->
    #list_node{val = Total rem 10, next = (case Total div 10 of
                                           0 -> null;
                                           Next -> to_list(Next)
                                       end
    )}
    .
