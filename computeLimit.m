function limit_value = computeLimit(tf_input, limit_value_at, multiply_by_variable)
    [num, den] = tfdata(tf_input, 'v');

    syms variable;
    numerator_sym = poly2sym(num, variable);
    denominator_sym = poly2sym(den, variable);

    expression = numerator_sym / denominator_sym;
    if multiply_by_variable
        expression = expression * variable;  % Multiply by the variable for ramp input
    end
    limit_result = limit(expression, variable, limit_value_at);
    limit_value = double(limit_result);
end