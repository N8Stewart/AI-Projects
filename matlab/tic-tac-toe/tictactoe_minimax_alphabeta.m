function [ move, score ] = tictactoe_minimax_alphabeta( state, alpha, beta )
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
    
    winner = is_terminal(state);
    if winner ~= -1 %Stop if the game is over
        move=[];
        score = sum(state==0) + 1;
        if winner == 2
            score = score * -1; % If human one, make score negative
        elseif winner == 0 % if it's a draw, score is 0
            score = 0;
        end
        return;
    end

    if who == 1
        score = -6;
    else
        score = 6;
    end
    move = [];
    for i=find(state==0) %Find possible moves
        new_state=state;
        new_state(i)=who; %Apply move

		% Recurse to find results of this move
        [~, sub_score]=tictactoe_minimax_alphabeta(new_state, alpha, beta);
        if who == 1
            if sub_score > score 
                score = sub_score;
                alpha = sub_score;
                move = i;
            end
        else
            if sub_score < score 
                score = sub_score;
                beta = sub_score;
                move = i;
            end
        end
        if alpha >= beta % prune since branch will never be chosen
            break;
        end
    end
end
