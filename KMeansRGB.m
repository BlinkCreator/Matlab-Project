%KMeansRGB function will calculate the mean value for each cluster given
%to it.
%
%Inputs:  - img(A 3D image array from which to gather RGB values from)
%         - kmeans( A single interger refering to the number of clusters
%         - maxIterations ( The maximum number of iterations to preform)
%
%Outputs: - Clusters(A 2D array of each pixel being replaced by a number
%         corresponding to the clostest kmean)
%         - ConvergedKMeans (A 3D array with k rows, 1 collumn and 3 layers
%         which are the colour values for the random points)
%
%Author:  Miyyceo

function [Clusters,ConvergedKMeans] = KMeansRGB(img,kmeans,maxIterations)

%Runs through max itertaions and reassigns kmeans until matched or ran out.
for i = 1:maxIterations
    if kmeans == UpdateMeans(img,size(kmeans,1),AssignToClusters(img,kmeans))
        Clusters = clusters;
        ConvergedKMeans = kmeans;
        return %Exits the function if Converged Kmeans is found
    else
        clusters = AssignToClusters(img,kmeans);
        kmeans = UpdateMeans(img,size(kmeans,1),clusters);
    end
end

%Returns the last cluster and kmeans values and prints the message
Clusters = clusters;
ConvergedKMeans = kmeans;
('Maximum number of  iterations reached before converagence was achieved');

end
