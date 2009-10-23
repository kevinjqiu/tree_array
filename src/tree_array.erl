%% Author: kevin.jingqiu
%% Created: Oct 23, 2009
%% Description: TODO: Add description to tree_array
-module(tree_array).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([new/0, put/3, get/2, hirem/1]).
-record(node, {value, left, right}).

%%
%% API Functions
%%

new() ->
    #node{value=null, left=null, right=null}.

put(TreeArray, Index, Item) ->
    ok.

get(TreeArray, Index) ->
    ok.

hirem(TreeArray) ->
    ok.

%%
%% Local Functions
%%

