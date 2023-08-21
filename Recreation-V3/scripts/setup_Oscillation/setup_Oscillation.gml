///@ function setup_Oscillation()
function setup_Oscillation(_value, _add, _inc, _limit){
	return {
		value		: _value,		// Actual value. Starts at this baseline.
		additive	: _add,			// Value that "a" is increased/decreased by.
		increment	: _inc,			// Amount that "b" increments by.
		limiter		: _limit,		// Polarity is reversed when "b" reaches this value.
		polarity	: 1				// Polarity of var "b".
	}
}