function [ child_states, actions ] = successor_8puzzle( parent_state )
    set_expanded_state_count(get_expanded_state_count()+1); %Do this to count the number of states evaluated by a search algorithm

    % Generate the possible moves (actions) and board configurations
    % (states) that are possible/legal from the current provided
    % configuration of an 8-puzzle board
    
    % The state will be described with the following structure:
    %   A row vector [ a b c d e f g h i ]
    % Which corresponds to the following 8-puzzle board:
    %   | a b c |
    %   | d e f |
    %   | g h i |
    % Where a-i are replaced with 1-8 for their respective tiles
    % or 0 for the blank space.
    
    % Each move (action) will be described with a single integer
    % as follows:
    %   1 -> Move the blank space left one place
    %   2 -> Move the blank space right one place
    %   3 -> Move the blank space up one place
    %   4 -> Move the blank space down one place
    
    % The return value child_states should be a matrix where each
    % row is one state as described above
    
    % The return value actions should be a column vector where each
    % row is one move as described above.
    
    % The rows in child_states and actions should correspond. That is, each
    % row (state) in child_states should be the state that results from
    % performing the move from the same row in actions
end

