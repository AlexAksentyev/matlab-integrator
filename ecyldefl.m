function [f, L, left, right] = ecyldefl(length, V, R, HGAP)

    global m q G c MeV W0
    R1 = R-HGAP;
    R2 = (R * R) / R1;
    
    if(V==j)
        v =  W2vel(W0*MeV);
        g = W2gamma(W0*MeV);
        E0 = (m * g * v * v) / (-q * R);
        V = (E0 * R * log(R2 / R1)) / (-2);
    end
    
    f = @(s, X)emfunction(s, X, 1/R, @(t,x,y,s)Ex(t,x,y,s,V,R1,R2, R), @(t,x,y,s)Ey(t,x,y,s), @(t,x,y,s)Es(t,x,y,s), @(t,x,y,s)Bx(t,x,y,s), @(t,x,y,s)By(t,x,y,s), @(t,x,y,s)Bs(t,x,y,s));
    L = length;
    
    left = @(X)leftKick(X, V, R1, R2, R, q, W0*MeV);
    right = @(X)rightKick(X, V, R1, R2, R, q, W0*MeV);
    
end

function Ex = Ex(t,x, y, s, V, R1, R2, R)
    Ex = -2*V/(log(R2/R1)*(R+x));
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

function Xk = leftKick(X, V, R1, R2, R, q, W0)
    x=X(1);
    u = -V + 2*V*log((R+x)/R1)/log(R2/R1);
    Xk = X;
    Xk(6) = Xk(6) - q *u/W0;
end
function Xk = rightKick(X, V, R1, R2, R, q, W0)
    x=X(1);
    u = -V + 2*V*log((R+x)/R1)/log(R2/R1);
    Xk = X;
    Xk(6) = Xk(6) + q *u/W0;
end