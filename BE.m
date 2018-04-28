function yn=BE(l,x0,t0,tn,residual)
    dt=(tn-t0)/l;
    yn=zeros(length(x0),l);
    %yn1=yn(:,1);
    yn(:,1)=x0;
    %yn1=x0;
    p=1;
    yn1=yn(:,1)+dt*f(yn(:,1),t0);
    tn1=t0;
    for i=1:l-1
        yn1=yn(:,i)+dt*f(yn(:,i),tn1);
        tn1=tn1+dt;
        j=0;
        do
            gn=g(yn(:,i),yn1,tn1,dt);
            %dg=dt*2*1-1;
            dg=inv(jacobiang(yn(:,i),yn1,tn1,dt));
            yn1Old=yn1;
            yn1New=yn1Old-dg*gn;
            yn1=yn1New;
            j=j+1;
            if(j>10000)
                break;
            end
        until(abs(max(yn1New-yn1Old))<residual || abs(max(gn))<residual)
        if(j>10000)
                break;
                if p
                    fprintf('Solution may tend to infinity or it has no Solution');
                    p=0;
                end
            end
        yn(:,i+1)=yn(:,i)+dt*f(yn1New,tn1);
        waitbar(i/(l-1))
    end
end
