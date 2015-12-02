% Specify input points
x=[0.5;1.5;2.5;3.5;4.5];
y=[0.327;1.169;2.326;3.724;5.323];
% Specify step vector for plotting points on the line
xp=0:0.1:5;

%%% Linear %%%
% Create the A matrix 
A=[x ones(size(x,1),1)];
    % Compute the minimum error parameters. a = mb(1), b = mb(2) 
    mb = inv(A'*A)*A'*y
    % Compute sum of error
    E1 = sum((mb(1)*x+mb(2)-y).^2);
    % Plot the minimum error function and the input points
    subplot(2,2,1)
    plot(xp,mb(1)*xp+mb(2),'--k',x,y,'xr')
    title('f(x,a,b) = ax+b')
    xlabel(['Sum Squared Error=',num2str(E1)])
    
%%% Quadratic %%%
% Create the A matrix 
A=[x.^2 x ones(size(x,1),1)];
    % Compute the minimum error parameters. a = mb(1), b = mb(2), c = mb(3)
    mb = inv(A'*A)*A'*y
    % Compute sum of error
    E2 = sum((mb(1)*x.^2+mb(2)*x+mb(3)-y).^2);
    % Plot the minimum error function and the input points
    subplot(2,2,2)
    plot(xp,mb(1)*xp.^2+mb(2)*xp+mb(3),'--k',x,y,'xr')
    title('f(x,a,b,c) = ax^2+bx+c')
    xlabel(['Sum Squared Error=',num2str(E2)])

%%% Cubic %%%
% Create the A matrix 
A=[x.^3 x.^2 x ones(size(x,1),1)];
    % Compute the minimum error parameters. a = mb(1), b = mb(2), c =
    % mb(3), d = mb(4)
    mb = inv(A'*A)*A'*y
    % Compute sum of error
    E3 = sum((mb(1)*x.^3+mb(2)*x.^2+mb(3)*x+mb(4)-y).^2);
    % Plot the minimum error function and the input points
    subplot(2,2,3)
    plot(xp,mb(1)*xp.^3+mb(2)*xp.^2+mb(3)*xp+mb(4),'--k',x,y,'xr')
    title('f(x,a,b,c,d) = ax^3+bx^2+cx+d')
    xlabel(['Sum Squared Error=',num2str(E3)])
    
%%% Quartic %%%
% Create the A matrix 
A=[x.^4 x.^3 x.^2 x ones(size(x,1),1)];
    % Compute the minimum error parameters. m = mb(1), b = mb(2), c =
    % mb(3), d = mb(4), e = mb(5)
    mb = inv(A'*A)*A'*y
    % Compute sum of error
    E4 = sum((mb(1)*x.^4+mb(2)*x.^3+mb(3)*x.^2+mb(4)*x+mb(5)-y).^2);
    % Plot the minimum error function and the input points
    subplot(2,2,4)
    plot(xp,mb(1)*xp.^4+mb(2)*xp.^3+mb(3)*xp.^2+mb(4)*xp+mb(5),'--k',x,y,'xr')
    title('f(x,a,b,c,d,e) = ax^4+bx^3+cx^2+dx+e')
    xlabel(['Sum Squared Error=',num2str(E4)])
    