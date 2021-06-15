load('notspdpk.mat');
try
mat = chol(pk,'lower');
catch exception
    mat = chol(nearestSPD(pk),'lower');
    mat = mat.*(abs(pk(1,1)/mat(1,1)));
end