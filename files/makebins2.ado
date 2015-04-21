program define makebins2
	syntax varname, [PREfix(name) min(real 0) max(real 100) step(real 1)]
	local var `varlist'
	
	if mod(`max' - `min',`step') != 0 {
		di as error "Warning: Step size `step' does not divide evenly into range. Top bin will have extend beyond `max'."
	}
	
	* Declare prefix
	if "`prefix'" != "" {
		local p `prefix'
	}
	else {
		local p b_`var'_
	}
	
	local numbins = ceil((`max' - `min') / `step') + 2
	local maxbin = `numbins' - 1

	
	tempvar binvar
	qui gen int `binvar' = floor((`var' - `min') / `step') + 1
	qui replace `binvar' = 0 if `binvar' < 0
	qui replace `binvar' = `maxbin' if `binvar' > `maxbin'

	* Create labeled bin dummies
	forvalues b = 0/`=`numbins'-1' {
			* Labels for all bins
		local bmin = `b' * `step' + `min' - `step'
		local bmax = `b' * `step' + `min'
		
		* Labels for edge bins
		if (`b' == 0) {
			local bmin "-\infty"
		}
		if (`b' == `maxbin') {
			local bmax "\infty"
		}
		* Create dummy, label it
		capture drop `p'`b'
		quietly gen `p'`b' = `binvar' == `b'
		label var `p'`b' "[`bmin', `bmax')"	
	}
end