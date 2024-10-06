function x = inverse_arctan(y)
    % This function calculates the inverse of arctan((1-x)/(2*sqrt(x))) given y

    % Calculate tan(y)
    tan_y = tan(y);
    
    % Calculate the positive root
    sqrt_x = -tan_y + sqrt(tan_y^2 + 1);
    
    % Square the result to get x
    x = sqrt_x^2;
end