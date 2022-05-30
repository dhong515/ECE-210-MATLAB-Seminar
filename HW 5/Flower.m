%% Danny Hong HW 5 ECE 210
%% Flower Class 

classdef Flower
    
    properties  
        
        petalWidth;
        petalLength;
        sepalWidth;
        sepalLength;     
        species;
        
    end
    
    methods
        
        function sWidth = getSWidth(flower1)
            sWidth = flower1.sepalWidth;
        end
        
        function flower = Flower(pWidth, pLength, sWidth, sLength, species)    
            if nargin > 0  
                flower.petalWidth = pWidth;
                flower.petalLength = pLength;
                flower.sepalWidth = sWidth; 
                flower.sepalLength = sLength;  
                flower.species = species;
            end
        end
        
        function report = report(flower1)
            fprintf("The length and width of its sepal are "+ flower1.sepalLength +"cm and "+ flower1.sepalWidth +"cm respectively, while the length and width of its petal are "+ flower1.petalLength +"cm and "+ flower1.petalWidth +"cm respectively. It belongs to the "+ flower1.species +" species. \n"); 
        end
        
    end            
     
end    