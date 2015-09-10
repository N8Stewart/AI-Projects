function [ solution_state, solution_path ] = dls(initial_state, successor_func, goaltest_func, depth_limit )
    %Implement depth-limited search to find a goal state, starting from the
    %specified initial state
    
    %Use the successor_func argument to get successors. It may be called
    %just like any other Matlab function.
    %For example:
    %   [child_states,actions]=successor_func(current_state);
    
    %Similarly, use goaltest_func to test whether a state is the goal state
    
    %If a solution is found, return the final state and path (list (vector) of
    %actions) needed to reach that state
    
    %If no solution is found, return the empty matrix []
    
    %HINT: This task will be much easier if you implement it recursively.
    %If you choose to do so, pay special attention to how the initial_state
    %and depth_limit arguments should change for the recursive call (the
    %other two arguments should be passed directly/unchanged).
end

