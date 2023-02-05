*
*
*
*
* 06/04/2018 
*
* 
*
* Robustness Checks 
* 
* Panel Regressions    
* 
* Limited Data only reflecting Truman and LM Transparency (2005 - Present)

/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/

foreach y of varlist Capital_Formation_-Work_capital_financed_banks_ {
	foreach x of varlist WBGI_Corruption_Control_-ICRG_Socioeconomic_Condtns_ {
		foreach z of varlist LM_original_ LM_both_zero_ LM_noSWF_zero_ avg_Truman_zero_no_swf avg_Truman_zero_both avg_Truman_original {

			cd "/Users/hossainpazooki/Dropbox/Research/Hossain/Tables & Results/June 2018/SWF Quality/`z'" 
			capture mkdir "`y'"
			cd "`y'"
			capture mkdir "`x'"
			cd "`x'"
			capture mkdir "Fixed Effects"
			cd "Fixed Effects"

			local i 0
			capture log close
			log using `y'`x', replace

			describe `y'
			noi di as smcl "{newpage}"

			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) replace
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_ `z' c.`z'#c.Rents_Capita_lag_mil if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) replace
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  `x' `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Age_#c.Rents_Capita_lag_mil) `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.Age_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.Rents_Capita_lag_mil `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.Rents_Capita_lag_mil `x' `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  `x' SWF_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Age_#c.Rents_Capita_lag_mil) SWF_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  `x' c.Commodity_Dummy_Panel_#c.SWF_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Age_#c.Rents_Capita_lag_mil) c.Commodity_Dummy_Panel_#c.SWF_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Commodity_Dummy_Panel_#c.SWF_Dummy_Panel_)  c.Commodity_Dummy_Panel_#c.SWF_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   `x' Monarchy_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Age_#c.Rents_Capita_lag_mil) Monarchy_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.Monarchy_Dummy_Panel_ Monarchy_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.Monarchy_Dummy_Panel_ Monarchy_Dummy_Panel_ SWF_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.SWF_Dummy_Panel_ Monarchy_Dummy_Panel_ SWF_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   `x' c.SWF_Dummy_Panel_#c.Rents_Capita_lag_mil `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Age_#c.Rents_Capita_lag_mil) c.SWF_Dummy_Panel_#c.Rents_Capita_lag_mil `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   `x' c.Rents_Capita_lag_mil#c.Monarchy_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   `x' c.`x'#c.SWF_Dummy_Panel_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   `x' c.`x'#c.Monarchy_Dummy_Panel_  `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  Dependency_ratio `x' `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  Dependency_ratio c.`x'#(c.Age_#c.Rents_Capita_lag_mil)  `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  CTOT_volatility_ `x' `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  CTOT_volatility_ c.`x'#(c.Age_#c.Rents_Capita_lag_mil)  `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   c.`x'##c.CTOT_volatility_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  CTOT_volatility_ c.`x'#c.CTOT_volatility_ `z' if year>2005, fe
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"











			log close 
			translate `y'`x'.smcl `y'`x'.pdf, replace
			erase `y'`x'.smcl
			erase `y'`x'.txt

			cd ..
			capture mkdir "Random Effects"
			cd "Random Effects"

			local i 0

			capture log close
			log using `y'`x', replace

			describe `y'
			noi di as smcl "{newpage}"

			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_ `z' if year>2005, re
			estimates store random1
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) replace
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_ `z' c.`z'#c.Rents_Capita_lag_mil if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) replace
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  `x' `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Age_#c.Rents_Capita_lag_mil) `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.Age_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.Rents_Capita_lag_mil `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.Rents_Capita_lag_mil `x' `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store fixed`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  `x' SWF_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Age_#c.Rents_Capita_lag_mil) SWF_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  `x' c.Commodity_Dummy_Panel_#c.SWF_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Age_#c.Rents_Capita_lag_mil) c.Commodity_Dummy_Panel_#c.SWF_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Commodity_Dummy_Panel_#c.SWF_Dummy_Panel_)  c.Commodity_Dummy_Panel_#c.SWF_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   `x' Monarchy_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Age_#c.Rents_Capita_lag_mil) Monarchy_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.Monarchy_Dummy_Panel_ Monarchy_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.Monarchy_Dummy_Panel_ Monarchy_Dummy_Panel_ SWF_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#c.SWF_Dummy_Panel_ Monarchy_Dummy_Panel_ SWF_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   `x' c.SWF_Dummy_Panel_#c.Rents_Capita_lag_mil `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  c.`x'#(c.Age_#c.Rents_Capita_lag_mil) c.SWF_Dummy_Panel_#c.Rents_Capita_lag_mil `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   `x' c.Rents_Capita_lag_mil#c.Monarchy_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   `x' c.`x'#c.SWF_Dummy_Panel_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   `x' c.`x'#c.Monarchy_Dummy_Panel_  `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  Dependency_ratio `x' `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  Dependency_ratio c.`x'#(c.Age_#c.Rents_Capita_lag_mil)  `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  CTOT_volatility_ `x' `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  CTOT_volatility_ c.`x'#(c.Age_#c.Rents_Capita_lag_mil)  `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_   c.`x'##c.CTOT_volatility_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			display "Model Number "`++i'
			xtreg `y' c.Age_ c.Rents_Capita_lag_mil L.Debt_GDP_  CTOT_volatility_ c.`x'#c.CTOT_volatility_ `z' if year>2005, re
			outreg2 using `y'`x', asterisk(se) excel bdec(2) sdec(2) append
			estimates store random`i'
			noi di as smcl "{newpage}"


			log close 
			translate `y'`x'.smcl `y'`x'.pdf, replace
			erase `y'`x'.smcl
			erase `y'`x'.txt

//Fixed vs Random Effects Test

			cd ..
			capture mkdir "Hausman Test"
			cd "Hausman Test"
			local i 0

			while `i' < 28 {

				capture log close
				log using Model_Number_`++i', replace

				capture hausman fixed`i' random`i', sigmamore

				log close 
				translate Model_Number_`i'.smcl Model_Number_`i'.pdf, replace
				erase Model_Number_`i'.smcl

			}

		}
	}
}
/*/


/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/

