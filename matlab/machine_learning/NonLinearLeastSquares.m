% Specify input points
x=[0.5;1.5;2.5;3.5;4.5];
y=[0.327;1.169;2.326;3.724;5.323];
% Specify step vector for plotting points on the line
xp=0:0.1:5;
% Create executable functions for jacobian and function
f=@(x,p) p(1)*x.^p(2)+p(3)*x+p(4);
J=@(p) [0.5.^p(2) p(1)*0.5^p(2)*log(0.5) 0.5 1;
        1.5.^p(2) p(1)*1.5^p(2)*log(1.5) 1.5 1;
        2.5.^p(2) p(1)*2.5^p(2)*log(2.5) 2.5 1;
        3.5.^p(2) p(1)*3.5^p(2)*log(3.5) 3.5 1;
        4.5.^p(2) p(1)*4.5^p(2)*log(4.5) 4.5 1];

% Specify initial guess values
pk=[0.4; 1.6; 0.1; 0.1];

for n = 1:4
    % Calculate p values
    dy=y-f(x,pk);
    Jk=J(pk);
    dp=inv(Jk'*Jk)*Jk'*dy;
    pk=pk+dp
    
    % calculate the sse
    sse = sum((y-f(x,pk)).^2);
    
    % Plot the minimum error function and the input points
    subplot(2,2,n)
    plot(xp,f(xp,pk),'--k',x,y,'xr')
    title(['Iteration k=',num2str(n)])
    xlabel(['Sum Squared Error=',num2str(sse)]) 
end
