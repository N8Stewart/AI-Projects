function [ ] = play()
    board=zeros(1,9);
    for turn=1:9
        who=mod(turn-1,2)+1;
        
        if who==1
            fprintf('\nCPU making its move, please wait...\n');
            [move,score]=tictactoe_minimax(board);
%             [move,score]=tictactoe_minimax_alphabeta(board,-inf,inf);
            fprintf('CPU chose %d\n',move);
            if score > 0
                fprintf('** CPU thinks it will win! **\n');
            elseif score < 0
                fprintf('** CPU thinks it will lose! **\n');
            elseif score == 0 && turn ~= 1
                fprintf('** CPU thinks the game is a draw! **\n');
            end
        else
            fprintf('\nPlease choose your move:\n');
            disp_board(board,true);
            move=input('Enter a move number: ');
            while board(move)~=0
                move=input('Enter a _valid_ move number: ');
            end
        end
        
        if board(move)~=0
            error('Invalid move');
        end
        board(move)=who;
        
        % If game is over, exit the loop
        winner = is_terminal(board);
        if winner == 0
            fprintf('Draw game\n');
            break;
        elseif winner == 1
            fprintf('CPU has won in %d moves\n', turn);
            break;
        elseif winner == 2
            fprintf('You have won in %d moves\n', turn);
            break;
        end
    end
    
    fprintf('\n');
    disp_board(board,false);
end

function [] = disp_board(state,show_pos)
    board=reshape(state,3,3);
    for r=1:3
        if r>1
            fprintf('-+-+-\n');
        end
        for c=1:3
            if c>1
                fprintf('|');
            end
            if board(r,c)==1
                fprintf('X');
            elseif board(r,c)==2
                fprintf('O');
            elseif show_pos
                fprintf('%d',(c-1)*3+r);
            else
                fprintf(' ');
            end
        end
        fprintf('\n');
    end
end
