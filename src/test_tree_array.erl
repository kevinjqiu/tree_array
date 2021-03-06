%% Author: kevin.jingqiu
%% Created: Oct 23, 2009
%% Description: TODO: Add description to test_tree_array
-module(test_tree_array).

-include("tree_array.hrl").

-include_lib("eunit/include/eunit.hrl").


-define(ONE, {a,nil,nil}).
-define(TWO, {nil,{a,nil,nil},nil}).
-define(THREE, {nil,nil,{a,nil,nil}}).
-define(FOUR, {nil,{nil,{a,nil,nil},nil},nil}).
-define(SEVEN, {nil,nil,{nil,nil,{a,nil,nil}}}).
-define(COMPLETE_10, {1,
                      {2,
                       {4,{8,nil,nil},nil},
                       {6,{10,nil,nil},nil}},
                      {3,
                       {5,{9,nil,nil},nil},
                       {7,nil,nil}}}).

empty_test() ->
    ?assertEqual({nil,nil,nil}, tree_array:new()).

single_elmt_test_() ->
    {setup,
     fun() -> tree_array:new() end,
     fun(_) -> ok end,
     fun generate_single_elmt_tests/1 }.


generate_single_elmt_tests(TreeArray) ->
    [?_assertEqual(?ONE, tree_array:put(TreeArray, 1, a)),
     ?_assertEqual(?TWO, tree_array:put(TreeArray, 2, a)),
     ?_assertEqual(?THREE, tree_array:put(TreeArray, 3, a)),
     ?_assertEqual(?FOUR, tree_array:put(TreeArray, 4, a)),
     ?_assertEqual(?SEVEN, tree_array:put(TreeArray, 7, a))].

complete_tree_test() ->
    ?assertEqual(?COMPLETE_10, complete_tree(1, 11, tree_array:new())).


get_test_() ->
    {setup,
     fun() -> complete_tree(1, 11, tree_array:new()) end,
     fun(_) -> ok end,
     fun generate_get_tests/1 }.


generate_get_tests(TreeArray) ->
    [?_assertEqual(1, tree_array:get(TreeArray, 1)),
     ?_assertEqual(2, tree_array:get(TreeArray, 2)),
     ?_assertEqual(3, tree_array:get(TreeArray, 3)),
     ?_assertEqual(7, tree_array:get(TreeArray, 7)),
     ?_assertEqual(nil, tree_array:get(TreeArray, 20))].


complete_tree(N, Total, TreeArray) ->
    if
        N < Total ->
            complete_tree(N+1, Total, tree_array:put(TreeArray, N, N));
        true ->
            TreeArray
    end.
