function [idt]=GFC_match(X,Y,delta)
Ni=2;
Xk=X;
k=1;
s=1;
while s
    X2=Xk;Y2=Y;
    normal.xm=0; normal.ym=0;
    normal.xscale=1; normal.yscale=1;
    [nX, nY, normal]=norm2s(X2,Y2);
    [idt, trans] = GFC(nX,nY,delta);
    trans=(trans)*normal.yscale+repmat(normal.ym,size(Y2,1),1);
    Xk = trans;
    if k==Ni
        s=0;
    else
        k=k+1;
    end
end
end