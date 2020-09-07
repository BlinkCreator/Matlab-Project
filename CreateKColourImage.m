%CreateKColourImage function will recreate an image with k-colours sourced
%from a list of means provided
%
%Inputs:  - clusters ( A 2D array specifying which cluster each pixel 
%         belongs to, in an image)
%         - convergedKMeans(A 3D array with k rows, 1 collumn and 3 layers
%         which are the colour values for the chosen means
%
%Outputs: - Kimg (A 3D array containing the updated points with the RGB 
%         - means )
%
%Author:  Miyyceo

function Kimg = CreateKColourImage(clusters,convergedKMeans)

%Creates an empty array for performance
Kimg = zeros(size(clusters,1),size(clusters,2),3);

%Isolates cluster and processes it with convergedKmeans into Kimg
for i = 1:size(clusters,2)%Moves down the rows
    for j = 1:size(clusters,1)%Moves across the collumns
        Kimg(j,i,:) = convergedKMeans(clusters(j,i),:,:);%Assigns the mean value
    end
end

Kimg = uint8(Kimg);%Converts the 3D array into img format

end