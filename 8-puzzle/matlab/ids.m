function [ solution_state, solution_path ] = ids(initial_state, successor_func, goaltest_func )
    %Implement iterative-deepening search to find a goal state, starting from the
    %specified initial state.

    %NOTE: Make use of your depth-limited search function to make this
    %easier
    
    %If a solution is found, return the final state and path (list (vector) of
    %actions) needed to reach that state
    
    %If no solution is found, return the empty matrix []
    
    % --------------------------------------------------------------------
    % Loop from 1 to 31 and call DLS for each depth. 31 is the max number
    % of moves to solve the 8 puzzle, so if it is not found at depth 31,
    % the solution does not exist.
    for i = 1:31
        [solution_state, solution_path] = dls(initial_state, successor_func, goaltest_func, i);
        % If the solution_state is not empty, return the solution
        if (~isempty(solution_state)) 
            return;
        end
    end
end

