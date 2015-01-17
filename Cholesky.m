function [ L,U ] = Cholesky( A)
[n]=size(A);
L=zeros(n);
L(1,1)=sqrt(A(1,1));
for k=2:n
    L(k,1)=A(k,1)./L(1,1);
end
for k=2:n
    tmp=A(k,k);
    for l=1:k-1
        tmp=tmp-L(k,l).^2;
    end
    L(k,k)=sqrt(tmp);
    for j=1:n
        if(k~=j)
            tmp=A(j,k);
            for l=1:k-1
                tmp=tmp-L(j,l).*L(k,l);
            end
            L(j,k)=tmp./L(k,k);
        end
    end
end
U=transp(L);
end
        