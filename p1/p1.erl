% Solution passes all tests with 4ms runtime (meets or beats 85.53% of
% competitors) and 65.41MB memory (meets or beats 5.26% of competitors)

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
