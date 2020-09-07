%UpdateMeans function will calculate the mean value for each cluster given
%to it.
%
%Inputs:  - img(A 3D image array from which to gather RGB values from)
%         - k( A single interger refering to the number of clusters
%         - clusters ( A 2D array specifying which cluster each pixel
%         belongs to, in an image)
%
%Outputs: - Means (A 3D array containing the updated RGB means with k rows)
%
%Author:  Miyyceo

function Means = UpdateMeans(img,k,clusters)

%Creates an empty array for speed
Means = zeros([k, 1, 3]);

for c =1:k%Cycles through cluster numbers
    
    %This section is responsible for moving through the image.
    for l = 1:3 %Moves into layers
        meanNumbers = zeros(size(img,1),size(img,2)); %Resets mean number array to zero
        meanCounter = 0; %Resets the m
        for i = 1:size(img,2)%Moves down the rows
            for j = 1:size(img,1)%Moves across the collumns
                if clusters(j,i) == c %tests for the cluster type
                    meanCounter = meanCounter+1;
                    meanNumbers(meanCounter) = img(j,i,l);
                end
            end
        end
        
        %This section is responsible for calculating the mean. Adapting an
        %function found at https://stackoverflow.com/questions/5488504/matlab-remov
        %e-leading-and-trailing-zeros-from-a-vector
        meanNumbers = meanNumbers(1:find(meanNumbers, 1, 'last'));
        meanTotal = 0; %Resets the mean total
        for m = 1:length(meanNumbers)
            meanTotal = meanTotal+meanNumbers(m);%adds all the RGB values
        end
        mean = meanTotal/length(meanNumbers);%Caculates the mean
        Means(c,1,l) = mean; %Assigns the cacluated mean to c row, 1 collom
        %and lowercase'L' layer
    end
end

end




