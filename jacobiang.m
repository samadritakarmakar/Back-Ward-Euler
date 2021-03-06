 function j=jacobiang(yn,yn1,tn1,dt)
 yn1_h=yn1*.00000002;
 
 l=length(yn1);
 yPlus_h=repmat(yn1,1,l)+diag(yn1_h); %Matrix y=y_ii+h; Fills Diagonals with y+h
    for i=1:l
        j(:,i)=(g(yn,yPlus_h(:,i),tn1,dt)-g(yn, yn1,tn1, dt))/yn1_h(i); %Find the Jacobian
    end
 end
