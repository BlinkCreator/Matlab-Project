%ClosestMean function will find the closest mean
%
%Inputs:  - imgPixel(A 3D array corrasponding to a point in an image)
%         - kmeans(A 3D array with k rows, 1 collumn and 3 layers
%         which are the colour values for the chosen points)
%
%Outputs: - ClosestTo(An interger corrasponding to the nth row of kmeans
%         imgpixel is closest to)
%
%Author:  Miyyceo

function ClosestTo = ClosestMean(imgPixel,kmeans)

SquareArray = zeros(1,size(kmeans,1));%Creates an empty Array to hold squared distances

%Updates SquareArray to a list of the squared distances
for i = 1:size(kmeans,1)
    SquareArray(i) = SquaredDistance(imgPixel,kmeans(i,1,:));
end

%Finds the first occurance of the lowest distance
for i = 1:length(SquareArray)
    if SquareArray(i) == min(SquareArray)
        ClosestTo = i;
        return
    end
end
