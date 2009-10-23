%% Author: kevin.jingqiu
%% Created: Oct 23, 2009
%% Description: TODO: Add description to tree_array
-module(tree_array).

%%
%% Include files
%%
-include("tree_array.hrl").

%%
%% Exported Functions
%%
-export([new/0, put/3, get/2, hirem/1]).

%%
%% API Functions
%%

new() ->
    #node{}.

put(_, 0, Value) ->
    #node{value=Value};

put(TreeArray, 1, Value) ->
    TreeArray#node{right=put(TreeArray, 0, Value)};

put(TreeArray, 2, Value) ->
    TreeArray#node{left=put(TreeArray, 0, Value)};

put(TreeArray, Index, Value) ->
    case Index rem 2 of
        0 ->
            case TreeArray#node.left of
                null ->
                    NewIndex = Index div 2,
                    case NewIndex rem 2 of
                        0 ->
                            TreeArray#node{left=put(TreeArray, NewIndex, Value)};
                        1 ->
                            TreeArray#node{right=put(TreeArray, NewIndex, Value)}
                    end;
                _ ->
                    TreeArray#node{left=put(TreeArray#node.left, Index div 2, Value)}
            end;
        1 ->
            case TreeArray#node.right of
                null ->
                    NewIndex = Index div 2,
                    case NewIndex rem 2 of
                        0 ->
                            TreeArray#node{left=put(TreeArray, NewIndex, Value)};
                        1 ->
                            TreeArray#node{right=put(TreeArray, NewIndex, Value)}
                    end;
                _ ->
                    TreeArray#node{right=put(TreeArray#node.right, Index div 2, Value)}
            end
    end.


get(TreeArray, Index) ->
    ok.

hirem(TreeArray) ->
    ok.

%%
%% Local Functions
%%

