function [ child_states, actions ] = successor_vacuum( parent_state )
    pos=parent_state(1);
    dirt=parent_state(2:3);
    
    child_states=[];
    actions=[];
    
    %Action 1: Move left
    new_pos=max([ 1 pos-1 ]);
    actions(end+1,1)=1; %Append to end of list
    child_states(end+1,:)=[ new_pos dirt ];
    
    %Action 2: Move right
    new_pos=min([ 2 pos+1 ]);
    actions(end+1,1)=2; %Append to end of list
    child_states(end+1,:)=[ new_pos dirt ];
    
    %Action 3: Vacuum
    new_dirt=dirt;
    new_dirt(pos)=max([ 0 new_dirt(pos)-1 ]);
    actions(end+1,1)=3; %Append to end of list
    child_states(end+1,:)=[ pos new_dirt ];
end
