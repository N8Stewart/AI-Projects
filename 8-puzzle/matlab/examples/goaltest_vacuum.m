function [ is_goal ] = goaltest_8puzzle( state )
    %No dirt left
    is_goal=all(state(2:3)==0);
end

