function [ move, score ] = tictactoe_minimax( state )
	% State is row vector representing a tic-tac-toe board
	% The positions correspond as follows
	% 1|4|7
    % -+-+-
    % 2|5|8 -> [ 1 2 3 4 5 6 7 8 9 ]
    % -+-+-
    % 3|6|9
	% For each board location, use the following:
	%   0 if this space is blank
	%   1 if it is X (i.e. the CPU player)
	%   2 if it is O (i.e. the human player)
	
    turn=10-sum(state==0); %Figure out which turn it is (from the board)
    who=mod(turn-1,2)+1; %And get who's turn it is
    
    if is_terminal(state) %Stop if the game is over
        move=[];
        score=utility(state);
        return;
    end

    score = -6;
    for i=find(state==0) %Find possible moves
        new_state=state;
        new_state(i)=who; %Apply move

		% Recurse to find results of this move
        [sub_move, sub_score]=tictactoe_minimax(new_state);
        
        if sub_score > score 
            score = sub_score;
            move = sub_move;
        end
    end
end

function [yes]=is_terminal(state)
	% **********************
	% TASK: Implement the terminal test
	% Return true if X or O has won, or a draw
	% Return false otherwise
	% **********************
    
    % Check vertical
    if (state(1) == 1 && state(2) == 1 && state(3) == 1) || ...
       (state(1) == 2 && state(2) == 2 && state(3) == 2)
        yes = true;
        return;
    end
    if (state(4) == 1 && state(5) == 1 && state(6) == 1) || ...
       (state(4) == 2 && state(5) == 2 && state(6) == 2)
        yes = true;
        return;
    end
    if (state(7) == 1 && state(8) == 1 && state(9) == 1) || ...
       (state(7) == 2 && state(8) == 2 && state(9) == 2)
        yes = true;
        return;
    end
    
    % Check Horizontal
    if (state(1) == 1 && state(4) == 1 && state(7) == 1) || ...
       (state(1) == 2 && state(4) == 2 && state(7) == 2)
        yes = true;
        return;
    end
    if (state(2) == 1 && state(5) == 1 && state(8) == 1) || ...
       (state(2) == 2 && state(5) == 2 && state(8) == 2)
        yes = true;
        return;
    end
    if (state(3) == 1 && state(6) == 1 && state(9) == 1) || ...
       (state(3) == 2 && state(6) == 2 && state(9) == 2)
        yes = true;
        return;
    end
    
    % Check diagonal
    if (state(1) == 1 && state(5) == 1 && state(9) == 1) || ...
       (state(1) == 2 && state(5) == 2 && state(9) == 2)
        yes = true;
        return;
    end
    if (state(3) == 1 && state(5) == 1 && state(7) == 1) || ...
       (state(3) == 2 && state(5) == 2 && state(7) == 2)
        yes = true;
        return;
    end
    
    % Check draw
    yes = all(state);
    
end

function [score]=utility(state)
	% **********************
	% TASK: Implement the utility function
	
	%Return the utility score for a given board
	
	%Give score of 0 if the board is a draw
	%Give a large, positive score if it was a fast win (i.e., 5 if it only took 5 moves to win)
	%Give a small, positive score if it was a slow win (i.e., 1 if it took all 9 moves to win)
	%Give a small, negative score if it was a slow loss (i.e., -1 if it took all 9 moves to lose)
	%Give a large, negative score if it was a fast loss (i.e., -5 if it only took 5 moves to lose)
	% **********************
    
    
end
