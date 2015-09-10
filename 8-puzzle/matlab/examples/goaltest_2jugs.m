function [ is_goal ] = goaltest_2jugs( state )
    % 3gal jug has exactly 1 gal in it
    is_goal = ( state(1)==1 );
end

