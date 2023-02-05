*
*
*
*
* 11/26/2017  
*
* 
*
* Robustness Checks
* 
* Cross Section Regressions 
* 

/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/


foreach y in change_Assets_per_GDP_e12 Truman_Total_pchange_avg {
foreach x of varlist ICRG_Bureaucracy_Quality_av10-WBGI_Accountability_av10 {


cd "/Users/hossainpazooki/Dropbox/Research/Hossain/Tables & Results/October 2017/Cross Section/" 
capture mkdir "`y'"
cd "`y'"
capture mkdir "`x'"
cd "`x'"

local i 1

capture log close
log using `y'`x', replace
describe `y'
noi di as smcl "{newpage}"


display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) replace
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 `x'
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#(c.Age_av10#c.Rents_Capita_e6_av10)

	matrix r = r(table)
	scalar p = r[4,5]


outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

	if p < .1 {

		display "Model Number "`++i'
		reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#c.Age_av10
		outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
		noi di as smcl "{newpage}"

		display "Model Number "`++i'
		reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#c.Rents_Capita_e6_av10
		outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
		noi di as smcl "{newpage}"
		
		clear matrix
		scalar drop p
				
	}

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 `x' SWF_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#(c.Age_av10#c.Rents_Capita_e6_av10) SWF_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 `x' c.Commodity_Dummy#c.SWF_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#(c.Age_av10#c.Rents_Capita_e6_av10) c.Commodity_Dummy#c.SWF_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#(c.Commodity_Dummy#c.SWF_Dummy)  c.Commodity_Dummy#c.SWF_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10  `x' Monarchy_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#(c.Age_av10#c.Rents_Capita_e6_av10) Monarchy_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#c.Monarchy_Dummy Monarchy_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#c.Monarchy_Dummy Monarchy_Dummy SWF_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#c.SWF_Dummy Monarchy_Dummy SWF_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10  `x' c.SWF_Dummy#c.Rents_Capita_e6_av10
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'#(c.Age_av10#c.Rents_Capita_e6_av10) c.SWF_Dummy#c.Rents_Capita_e6_av10
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10  `x' c.Rents_Capita_e6_av10#c.Monarchy_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10  `x' c.`x'#c.SWF_Dummy
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10  `x' c.`x'#c.Monarchy_Dummy 
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 avg_LM_Transparency `x'
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 avg_LM_Transparency c.`x'#(c.Age_av10#c.Rents_Capita_e6_av10) 
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 Dependency_ratio_av10 `x'
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 Dependency_ratio_av10 c.`x'#(c.Age_av10#c.Rents_Capita_e6_av10) 
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 avg_CTOT_volatility_2004_2014 `x'
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 avg_CTOT_volatility_2004_2014 c.`x'#(c.Age_av10#c.Rents_Capita_e6_av10) 
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 c.`x'##c.avg_CTOT_volatility_2004_2014
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

display "Model Number "`i++'
reg `y' c.Age_av10##c.Rents_Capita_e6_av10 c.Rents_Capita_e6_av10#c.Rents_Capita_e6_av10 avg_CTOT_volatility_2004_2014 c.`x'#c.avg_CTOT_volatility_2004_2014
outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
noi di as smcl "{newpage}"

log close 
translate `y'`x'.smcl `y'`x'.pdf, replace
erase `y'`x'.smcl
erase `y'`x'.txt

}
}
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/

