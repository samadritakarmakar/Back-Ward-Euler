function yn=FE(l,x0,t0,tn,residual)
dt=(tn-t0)/l;
yn=zeros(length(x0),l);
yn(:,1)=x0;
t=t0;
for i=1:l-1
yn(:,i+1)=yn(:,i)+dt*f(yn(:,i),t);
t=t0+dt;
end
end
