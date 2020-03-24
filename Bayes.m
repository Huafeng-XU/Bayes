clear all;
%row 1 represent x in coordinate system.
%row 2 represent y in coordinate system.
X1=[2 3 3 4 5 5 6 6
   6 4 5 3 2 4 0 1];
X1_x = X1(1,:);
X1_y = X1(2,:);

X2=[6 6 7 8 8 9 9 10
   4 5 3 2 4 0 2 1];
X2_x = X2(1,:);
X2_y = X2(2,:);

%Plot X1 and X2 Training data in coordinate system.
figure('Name','X1 and X2 Training data in coordinate system')
scatter(X1_x,X1_y,'filled','red')
hold on
scatter(X2_x,X2_y,'filled','green')
scatter(4,6,'filled','black')
grid on
axis([0 12 -2 8])
xlabel('X');
ylabel('Y');

%Probability density function of each class is Gaussian
Pw1 = 1/2;
Pw2 = 1/2;

%Calculate the mean value of X1,X2
meanX1 = (1/8 * sum(X1'))';
meanX2 = (1/8 * sum(X2'))';

%Calculate scatter matrices Si 
SX1 = (X1 - meanX1) * (X1 - meanX1)';
SX2 = (X2 - meanX2) * (X2 - meanX2)';

%Calculate the Matrix inverse of Si 
SX1P = inv(SX1);
SX2P = inv(SX2);

%For decision function
%Find out the query input q=(4,6) belongs to which class
q = [4 6]';
gX1 = -0.5 * q' * SX1P * q + meanX1' * SX1P * q -0.5 * meanX1' * SX1P * meanX1 - 0.5 * log(abs(det(SX1)));
      
gX2 = -0.5 * q' * SX2P * q + meanX2' * SX2P * q -0.5 * meanX2' * SX2P * meanX2 - 0.5 * log(abs(det(SX2)));      

if gX1 > gX2
    class =  1;
else
    class = 2;
end
class


