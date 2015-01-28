function [P] = koch(level)

P = [ 0 0; 1 0; cos(-pi/3), sin(-pi/3); 0 0 ]; % a triangle
for iteration=1:5
newP = zeros( size(P,1)*4+1, 2);
for i=1:size(P,1)-1
newP(4*i+1,:) = P(i,:);
newP(4*i+2,:) = (2*P(i,:) + P(i+1,:) )/3;
link = P(i+1,:)-P(i,:);
ang = atan2( link(2), link(1) );
linkLeng = sqrt( sum(link.^2) );
newP(4*i+3,:) = newP(4*i+2,:) + (linkLeng/3)*[ cos(ang+pi/3), sin(ang+pi/3) ];
newP(4*i+4,:) = (P(i,:) + 2*P(i+1,:) )/3;
end
newP( 4*size(P,1)+1,:) = P(size(P,1),:);
P = newP;
end
hold on; axis equal;
plot( P(:,1), P(:,2) );
hold off;

end