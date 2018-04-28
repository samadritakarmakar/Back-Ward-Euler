function gn=g(yn,yn1,tn1,dt)
    gn=yn+dt*f(yn1,tn1)-yn1;
end
