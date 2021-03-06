%% Author: kevin.jingqiu
%% Created: Oct 23, 2009
%% Description: A growable tree based on binary tree
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
    {nil, nil, nil}.

put(Node, Index, Value) when Index < 2 ->
    case Node of
        nil ->
            put({nil, nil, nil}, Index, Value);
        {nil, nil, nil} ->
            {Value, nil, nil};
        {MyValue, Left, Right} ->
            case Index of
                0 ->
                    {MyValue, setelement(?VALUE, Left, Value), Right};
                1 ->
                    {MyValue, Left, setelement(?VALUE, Right, Value)}
            end
    end;

put(nil, Index, Value) ->
    put({nil, nil, nil}, Index, Value);

put(Node, Index, Value) ->
    {MyValue, Left, Right} = Node,

    case Index rem 2 of
        0 ->
            {MyValue, put(Left, Index div 2, Value), Right};
        1 ->
            {MyValue, Left, put(Right, Index div 2, Value)}
    end.


get(nil, _) -> nil;

get(Node, Index) when Index < 2 ->
    {Value, _, _} = Node,
    Value;

get(Node, Index) ->
    {_, Left, Right} = Node,
    case Index rem 2 of
        0 ->
            get(Left, Index div 2);
        1 ->
            get(Right, Index div 2)
    end.


hirem(TreeArray) ->
    ok.

