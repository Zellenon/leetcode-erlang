% Solution passes all tests with 2ms runtime (meets or beats 100.00% of
% competitors) and 64.90MB memory (meets or beats 14.47% of competitors)

-module(p1).

-export([two_sum/2]).

-spec two_sum(Nums :: [integer()], Target :: integer()) -> [integer()].
two_sum(Nums, Target) ->
    recurse(Nums, Target, 0, #{})
    .

recurse([N1 | Nums], Target, Index, Map) ->
    case maps:get(Target - N1, Map, none) of
        none -> recurse(Nums, Target, Index + 1, Map#{N1 => Index});
        RemainderIndex -> [RemainderIndex, Index]
    end.
