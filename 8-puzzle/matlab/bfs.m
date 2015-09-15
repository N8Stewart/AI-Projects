function [ solution_state, solution_path ] = bfs(initial_state, successor_func, goaltest_func )
    %Implement breadth-first search to find a goal state, starting from the
    %specified initial state
    
    %Use the successor_func argument to get child states. It may be called
    %just like any other Matlab function.
    %For example:
    %   [child_states,actions]=successor_func(current_state);
    
    %Similarly, use goaltest_func to test whether a state is the goal state
    
    %If a solution is found, return the final state and path (list (vector) of
    %actions) needed to reach that state
    
    %If no solution is found, return the empty matrix []
    
    % --------------------------------------------------------------------
    
    % Set the solution state and path if nothing is found
    solution_state = [];
    solution_path = [];
    
    counter = 1; % Set the first search to root node
    num_states = 1;
    % Initialize the matrix queue with the initial state
    state(counter, :) = initial_state;
    predecessor(counter) = 0;
    action(counter) = 0;
    
    % While there are still paths in the queue to be explored
    while (counter <= num_states)
        % Check for the goal state
        if (goaltest_func(state(counter, :)))
            solution_state = state(counter, :);
            % Collect the path into an array
            current_predecessor = counter;
            num_predecessors = 0;
            while(predecessor(current_predecessor) ~= 0)
                 num_predecessors = num_predecessors + 1;
                 solution_path = [ action(current_predecessor) solution_path ];
                 current_predecessor = predecessor(current_predecessor);
            end
            break;
        end
        
        % Append the successors of the current state to the end of queue
        [ child_states, actions ] = successor_func(state(counter, :));
        for i = 1:length(actions)
            % Optimization: Prevent previous state from entering queue
            successor_action = actions(i);
            previous_action = action(counter);
            if (successor_action == 1 && previous_action == 2 || ...
                successor_action == 2 && previous_action == 1 || ...
                successor_action == 3 && previous_action == 4 || ...
                successor_action == 4 && previous_action == 3)
                continue;
            end
            
            num_states = num_states + 1;
            state(num_states, :) = child_states(i, :);
            action(num_states) = actions(i);
            predecessor(num_states) = counter;
        end
        
        counter = counter + 1;
    end
    
end

