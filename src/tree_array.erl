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
    {nil, nil, nil}.

put({nil, nil, nil}, 0, Value) ->
    {Value, nil, nil};

put({nil, nil, nil}, 1, Value) ->
    {Value, nil, nil};

put(nil, Index, Value) ->
    put({nil, nil, nil}, Index, Value);

put(Node, 0, Value) ->
    {MyValue, Left, Right} = Node,
    {MyValue, setelement(?VALUE, Left, Value), Right};

put(Node, 1, Value) ->
    {MyValue, Left, Right} = Node,
    {MyValue, Left, setelement(?VALUE, Right, Value)};

put(Node, Index, Value) ->
    {MyValue, Left, Right} = Node,

    case Index rem 2 of
        0 ->
            case Left of
                nil ->
                    {MyValue, put(nil, Index div 2, Value), Right};
                _ ->
                    {MyValue,
                     setelement(?LEFT, Left, put(Left, Index div 2, Value)),
                      Right}
            end;
        1 ->
            case Right of
                nil ->
                    {MyValue, Left, put(nil, Index div 2, Value)};
                _ ->
                    {MyValue,
                     Left,
                     setelement(?RIGHT, Right, put(Right, Index div 2, Value))}
            end
    end.


get(TreeArray, Index) ->
    ok.

hirem(TreeArray) ->
    ok.

%%
%% Local Functions
%%
