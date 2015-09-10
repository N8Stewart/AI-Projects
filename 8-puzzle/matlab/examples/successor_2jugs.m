function [ child_states, actions ] = successor_2jugs( parent_state )
    vol_3gal=parent_state(1);
    vol_7gal=parent_state(2);
    
    child_states=[];
    actions=[];
    
    % Action 1: Pour 7gal into 3gal
    if vol_7gal > 0 % Doesn't make sense if empty
        vol_left=3-vol_3gal;
        vol_move=min([ vol_left vol_7gal ]);
        
        actions(end+1,1)=1; %Append to end of list
        child_states(end+1,:)=[ vol_3gal+vol_move  vol_7gal-vol_move ];
    end
    
    % Action 2: Pour 3gal into 7gal
    if vol_3gal > 0
        vol_left=7-vol_7gal;
        vol_move=min([ vol_left vol_3gal ]);
        
        actions(end+1,1)=2;
        child_states(end+1,:)=[ vol_3gal-vol_move  vol_7gal+vol_move ];
    end

    % Action 3: Empty 3gal jug
    if vol_3gal > 0
        actions(end+1,1)=3;
        child_states(end+1,:)=[ 0  vol_7gal ];
    end

    % Action 4: Empty 7gal jug
    if vol_7gal > 0
        actions(end+1,1)=4;
        child_states(end+1,:)=[ vol_3gal  0 ];
    end

    % Action 5: Fill 3gal jug
    if vol_3gal < 3 % Doesn't make sense if full
        actions(end+1,1)=5;
        child_states(end+1,:)=[ 3  vol_7gal ];
    end

    % Action 6: Fill 7gal jug
    if vol_7gal < 7
        actions(end+1,1)=6; %Append to end of list
        child_states(end+1,:)=[ vol_3gal  7 ];
    end
end
