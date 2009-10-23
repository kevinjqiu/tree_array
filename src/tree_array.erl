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
-define(VALUE, 1).
-define(LEFT, 2).
-define(RIGHT, 3).

%%
%% API Functions
%%

new() ->
    {null, null, null}.

put(_, 1, Value) ->
    {Value, null, null};

put(TreeArray, Index, Value) ->
    F = fun(Direction) ->
                Element = element(Direction, TreeArray),
                NewIndex = Index div 2,
                case Element of
                    null ->
                        case NewIndex rem 2 of
                            0 ->
                                setelement(?LEFT, TreeArray, {Value, null, null});
                            1 ->
                                setelement(?RIGHT, TreeArray, {Value, null, null})
                        end;
                    _ ->
                        setelement(Direction, TreeArray, put(element(Direction, TreeArray), NewIndex, Value))
                end
        end,

    case Index rem 2 of
        1 -> F(?LEFT);
        0 -> F(?RIGHT)
    end.


get(TreeArray, Index) ->
    ok.

hirem(TreeArray) ->
    ok.

%%
%% Local Functions
%%

