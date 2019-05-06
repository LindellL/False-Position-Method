function [root,func,xl,xu,es,maxiter] = FalsePosition(xl,xu)
%This function uses the false position method to solve for the roots of a
%given function.
%   Enter a function of x with a stopping criteria in order to solve for
%   the roots of the function. This is accomplished by using the false
%   position method.
f=(input('input function of x:','s'));
func=inline(f,'x');
es=input('value of error:','s')
iter=1;
sol=xl-((func(xl)*(xu-xl))/(func(xu)-func(xl)));
sol1=sol;
diff= abs(sol-sol1);
%Uses if statements in order to determine the new upper and lower bounds.
if func(xl)*func(xu)>0
    disp('there is no root')
elseif func(sol)==0
    xr=sol;
elseif func(sol)*func(xl)<0
    xu=sol;
    xr=func(xu);
else
    xl=sol;
    xr=func(xl);
end
%Enters a while function in order to determine how many iterations it takes
%to complete finding the root.
while diff>es
    iter=iter+1;
end
%Displays solutions to the functionby plugging back in the new upper and lower bounds.
sol1=sol;
iter=iter+1;
disp(func)
root=xr;
disp(xl)
disp(xu)
maxiter=iter
    

