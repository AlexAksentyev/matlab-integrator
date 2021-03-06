function [f, L, left, right] = emdrift(length)
    f = @(s, X)emfunction(s, X, 0, @(t,x,y,s)Ex(t,x,y,s), @(t,x,y,s)Ey(t,x,y,s), @(t,x,y,s)Es(t,x,y,s), @(t,x,y,s)Bx(t,x,y,s), @(t,x,y,s)By(t,x,y,s), @(t,x,y,s)Bs(t,x,y,s));
    L = length;
    
    left = @(X)leftKick(X);
    right = @(X)rightKick(X);
    
    f(0, [0;0;0;0.001;0;0.001;0;0;0]);
end

function Ex = Ex(t,x, y, s)
    Ex = 0;
end
function Ey = Ey(t,x, y, s)
    Ey = 0;
end
function Es = Es(t,x, y, s)
    Es = 0;
end
function Bx = Bx(t,x, y, s)
    Bx = 0;
end
function By = By(t,x, y, s)
    By = 0;
end
function Bs = Bs(t,x, y, s)
    Bs = 0;
end

function Xk = leftKick(X)
    Xk = X;
end
function Xk = rightKick(X)
    Xk = X;
end