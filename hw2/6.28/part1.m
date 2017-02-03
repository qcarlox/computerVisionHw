[X,Y,Z]=meshgrid(-10:.5:10,-10:.5:10,-10:.5:10);

val=surf(X,Y,Z);
figure(1)
isosurface(X,Y,Z,val,3);
xlabel('red');
ylabel('green');
zlabel('blue');
axis ([-10 10 -10 10 -10 10])
print(figure(1),'part1.png');
