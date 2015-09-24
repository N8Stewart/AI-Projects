function [winner]=is_terminal(state)
	% **********************
	% TASK: Implement the terminal test
	% Return 0 for draw, 1 for player win, 2 for computer win
	% Return -1 otherwise
	% **********************
    
    % Increment the state count
    set_expanded_state_count(get_expanded_state_count() + 1);
    
    % Check vertical
    if (state(1) == 1 && state(2) == 1 && state(3) == 1)
        winner = 1;
        return;
    end
    if (state(1) == 2 && state(2) == 2 && state(3) == 2)
        winner = 2;
        return;
    end
    if (state(4) == 1 && state(5) == 1 && state(6) == 1)
        winner = 1;
        return;
    end
    if (state(4) == 2 && state(5) == 2 && state(6) == 2)
        winner = 2;
        return;
    end
    if (state(7) == 1 && state(8) == 1 && state(9) == 1)
        winner = 1;
        return;
    end
    if (state(7) == 2 && state(8) == 2 && state(9) == 2)
        winner = 2;
        return;
    end
    
    % Check Horizontal
    if (state(1) == 1 && state(4) == 1 && state(7) == 1)
        winner = 1;
        return;
    end
    if (state(1) == 2 && state(4) == 2 && state(7) == 2)
        winner = 2;
        return;
    end
    if (state(2) == 1 && state(5) == 1 && state(8) == 1)
        winner = 1;
        return;
    end
    if (state(2) == 2 && state(5) == 2 && state(8) == 2)
        winner = 2;
        return;
    end
    if (state(3) == 1 && state(6) == 1 && state(9) == 1)
        winner = 1;
        return;
    end
    if (state(3) == 2 && state(6) == 2 && state(9) == 2)
        winner = 2;
        return;
    end
    
    % Check diagonal
    if (state(1) == 1 && state(5) == 1 && state(9) == 1)
        winner = 1;
        return;
    end
    if (state(1) == 2 && state(5) == 2 && state(9) == 2)
        winner = 2;
        return;
    end
    if (state(3) == 1 && state(5) == 1 && state(7) == 1)
        winner = 1;
        return;
    end
    if (state(3) == 2 && state(5) == 2 && state(7) == 2)
        winner = 2;
        return;
    end
    
    % Check draw
    winner = all(state) - 1;
    
end
