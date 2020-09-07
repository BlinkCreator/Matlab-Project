%AssignToClusters function assigns each pixel(point) in an image to a
%cluster based on what point it is closest to.
%
%Inputs:  - img(A 3D array corrasponding to an image)
%         - kmeans(A 3D array with k rows, 1 collumn and 3 layers
%         which are the colour values for the random points)
%
%Outputs: - Clusters(A 2D array of each pixel being replaced by a number
%         corresponding to the clostest kmean)
%
%Author:  Miyyceo

function Clusters = AssignToClusters(img,kmeans)

%Creates an empty Clusters array for performance
Clusters = zeros(size(img,1),size(img,2));

%Isolates pixel and processes it into the Clusters array
for i = 1:size(img,2)%Moves down the rows
    for j = 1:size(img,1)%Moves across the collumns
        Clusters(j,i) = ClosestMean(img(j,i,:),kmeans);
    end
end

end