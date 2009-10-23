%% Author: kevin.jingqiu
%% Created: Oct 23, 2009
%% Description: TODO: Add description to test_tree_array
-module(test_tree_array).

-include("tree_array.hrl").

-include_lib("eunit/include/eunit.hrl").

%%
%% Include files
%%

%%
%% Exported Functions
%%
%% -export([]).

empty_tree_array_test() ->
    ?assertMatch(#node{}, tree_array:new()).

