function [ is_goal ] = goaltest_8puzzle( state )
    % Return true ( is_goal=true; ) if the supplied 8-puzzle board
    % configuration is the goal. Return false otherwise.
    
    % Refer to the comments in successor_8puzzle for the structure of
    % the state argument
    
    % Use the goal configuration show in the slides.
    
    % --------------------------------------------------------------------
    % Goal state is such:
    % [ 1 2 3 ]
    % [ 8 0 4 ]
    % [ 7 6 5 ]
    % In row format, this is:
    % [ 1 2 3 8 0 4 7 6 5 ]
    is_goal = ( state(1) == 1 && ...
                state(2) == 2 && ...
                state(3) == 3 && ...
                state(4) == 8 && ...
                state(5) == 0 && ...
                state(6) == 4 && ...
                state(7) == 7 && ...
                state(8) == 6 && ...
                state(9) == 5);
    
end

