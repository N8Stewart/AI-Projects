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
    
    % --------------------------------------------------------------------
    % Find the blank space
    for i = 1:9
       if parent_state(i) == 0
           blank = i;
           break;
       end
    end
    
    % Determine the actions possible
    
    switch (blank);
        case 1
            actions = [ 2 4 ];
        case 2
            actions = [ 1 2 4 ];
        case 3
            actions = [ 1 4 ];
        case 4
            actions = [ 2 3 4 ];
        case 5
            actions = [ 1 2 3 4 ];
        case 6
            actions = [ 1 3 4 ];
        case 7
            actions = [ 2 3 ];
        case 8
            actions = [ 1 2 3 ];
        case 9
            actions = [ 1 3 ];
    end
    
    % For each action possible, determine the child matrix for that action
    child_states = zeros(size(actions, 2), 9);
    for i = 1:size(actions, 2)
       child_states(i,:) = compute_action(blank, actions(i), parent_state);
    end
    
end

% Compute the child matrix if the action provided were to be computed on
% the parent state
function [ child_state ] = compute_action( blank, action, parent_state )
    child_state = parent_state;
    switch(action)
        case 1 % Move blank left
            child_state(blank) = child_state(blank - 1);
            child_state(blank - 1) = 0;
        case 2 % Move blank right
            child_state(blank) = child_state(blank + 1);
            child_state(blank + 1) = 0;
        case 3 % Move blank up
            child_state(blank) = child_state(blank - 3);
            child_state(blank - 3) = 0;
        case 4 % Move blank down
            child_state(blank) = child_state(blank + 3);
            child_state(blank + 3) = 0;
    end
end

