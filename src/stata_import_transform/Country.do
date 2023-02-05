//
//
//
// Country Based Data Set for Sovereign Wealth Fund Analysis 


import excel "/Users/hossainpazooki/Dropbox/Research/Hossain/Excel Datasets/SWF_Country.xlsx", sheet("Data") cellrange(A1:EOU86) firstrow clear

//convert all numeric variables to stata numeric variables
destring Number Year_Founded SWF_Dummy-Dependency_ratio_2016, replace


forval num = 1990/2015 {

	cap gen Assets_GDP_e12_`num' = (Assets_`num' / GDP_`num') * 1000000000000 
	cap gen Rents_Capita_e6_`num' = (Rents_GDP_`num' * GDP_Capita_`num') / 1000000
	cap gen Rents_Pop_`num' = (Rents_GDP_`num' / Population_`num')
	
}

local gov "ICRG_Bureaucracy_Quality_ ICRG_Corruption_ ICRG_Democratic_Accountblty_ ICRG_Ethnic_Tensions_ ICRG_External_Conflict_ ICRG_Government_Stability_ ICRG_Internal_Conflict_ ICRG_Investment_Profile_ ICRG_Law_and_Order_ ICRG_Military_in_Politics_ ICRG_Religious_Tensions_ ICRG_Socioeconomic_Condtns_ WBGI_Corruption_Control_ WBGI_Govt_Effectiveness_ WBGI_Political_Stability_ WBGI_Regulatory_Quality_ WBGI_Rule_of_Law_ WBGI_Accountability_"

foreach i in `gov' {
 
	egen `i'av10 = rowmean(`i'2005-`i'2015)

}

local main "Private_Credit_ Financial_Credit_ Nonperforming_Loans_ Market_Capitalization_ Capital_Formation_ Assets_ Assets_GDP_e12_ Rents_Pop_ GDP_Capita_ Rents_GDP_ Rents_Capita_e6_ Age_ Dependency_ratio_"

foreach i in `main' {
 
	cap egen `i'av10 = rowmean(`i'2005-`i'2015)

}

gen Assets_percent_change = ((Assets_2015 - Assets_2007) / Assets_2007) * 100
gen Assets_absolute_change = Assets_2015 - Assets_2007

save "/Users/hossainpazooki/Dropbox/Research/Hossain/Stata Codes/Stata dta files/Country_non-panel.dta", replace

*
* Stop Generate if Cross Section (non-Panel) Regressions are used
*
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
/**********************************************************************************************************************************************************************/
*
* Panel Data Generate 
*

//
//
//
// Country Based Data Set for Sovereign Wealth Fund Analysis 


import excel "/Users/hossainpazooki/Dropbox/Research/Hossain/Excel Datasets/SWF_Country.xlsx", sheet("Data") cellrange(A1:EOU86) firstrow clear

//make all numeric variables completely numeric
destring Number Year_Founded SWF_Dummy-LM_noSWF_zero_2016, replace

// longest possible name 
generate longnameindeedthatneedstobeshort = 1

//make into long format for panel regressions 6/20/17 & drop 
reshape long Assets_ Age_ GDP_ Population_ GDP_Capita_ GDP_Growth_ Per_Capita_Growth_ Rents_GDP_ Debt_GDP_ LM_Transparency_ LM_original_ LM_both_zero_ LM_noSWF_zero_ SWF_Dummy_Panel_ Monarchy_Dummy_Panel_ Commodity_Dummy_Panel_ Truman_Total_  Open_Budget_Index_ WBGI_Corruption_Control_ WBGI_Govt_Effectiveness_ WBGI_Political_Stability_ WBGI_Regulatory_Quality_ WBGI_Rule_of_Law_ WBGI_Accountability_  ICRG_Bureaucracy_Quality_ ICRG_Corruption_ ICRG_Democratic_Accountblty_ ICRG_Ethnic_Tensions_ ICRG_External_Conflict_ ICRG_Government_Stability_ ICRG_Internal_Conflict_ ICRG_Investment_Profile_ ICRG_Law_and_Order_ ICRG_Military_in_Politics_ ICRG_Religious_Tensions_ ICRG_Socioeconomic_Condtns_ Capital_Formation_ Private_Credit_ Financial_Credit_ Foreign_Direct_Investment_ Nonperforming_Loans_ Market_Capitalization_ Gross_Savings_ Military_Expenditure_ Arms_Imports_ Corruption_Perceptions_ CTOT_growth_ Savings_excluding_emission_ Savings_including_emission_ Savings_CO2_damage_ Savings_education_ Savings_energy_depletion_ Savings_gross_adjusted_ Savings_resource_depletion_ Savings_net_national_ Savings_particulate_damage_ CTOT_volatility_ Bank_deposits_to_GDP_ Bank_capital_total_assets_ Bank_concentration_ Bank_credit_to_deposits_ Bank_nonperf_loans_to_gross_ Central_bank_assets_to_GDP_ Deposit_banks_assets_GDP_ Domestic_cred_private_GDP_ Financial_deposits_to_GDP_ Foreign_bank_assets_total_ Foreign_banks_total_banks_ Private_credit_by_all_GDP_ Private_credit_deposit_GDP_ Remittance_inflows_to_GDP_ Stock_market_capitalization_ Stock_market_return_ Stock_market_value_traded_ Stock_market_turnover_ratio_ Stock_price_volatility_ Total_factoring_volume_GDP_ Work_capital_financed_banks_ Dependency_ratio_, i(Country Number) j (year)

//delete duplicates
sort Number year
duplicates list Number year
duplicates drop Number year, force

tsset Number year

generate Rents_Capita_ = Rents_GDP_ * GDP_Capita_

generate Rents_Capita_lag_mil = l.Rents_Capita / 1000000

xtset Number year

label variable Country "Countries used in sample"
label variable SovereignWealthFund "All the Sovereign Welath Funds of Country. Assets aggregated when multiple SWF."
label variable Year_Founded "The Year the SWF was established"
label variable SWF_Type "Oil / Pension / Gas / Oil & Gas / Commodity / Non-Commodity / Fiscal Surplus"
label variable SWF_Dummy "Whether Country has a SWF"
label variable Commodity_Dummy "Whether the SWF is primarily funded by selling Oil or Gas or Minerals or Metals"
label variable Monarchy_Dummy "Whether a Monarch has significant influence on governance"
label variable MENA_Dummy "Regional dummy variable if country is in Middle East or North Africa"
label variable Asia_non_MENA_Dummy "Regional dummy variable if country is in Asia excluding Middle Eastern countries"
label variable Africa_non_MENA_Dummy "Regional dummy variable if country is in Africa excluding North African countries"
label variable Europe_Dummy "Regional dummy variable if country is in Europe"
label variable North_America_Dummy "Regional dummy variable if country is in North America"
label variable Latin_America_Dummy "Regional dummy variable if country is in South America"
label variable OECD_Dummy "Whether the country is a member of OECD"
label variable Assets_ "Assets (current US$ Billions) from Sovereign Wealth Fund Institute (0 if not founded, blank if no SWF)"
label variable LM_Transparency_ "Linaburg-Maduell Transparency Index (0-10) from SWF Institute"
label variable Age_ "Years SWF is in existence (0 if not founded or no SWF)"
label variable GDP_ "GDP (current US$)"
label variable Population_ "Population, total"
label variable GDP_Capita_ "GDP per capita (constant 2010 US$)"
label variable GDP_Growth_ "GDP growth (annual %)"
label variable Per_Capita_Growth_ "GDP per capita growth (annual %)"
label variable Rents_GDP_ "Total natural resources rents (% of GDP)"
label variable Truman_Total_ "Truman Total (Aggregate Scores)"
label variable Open_Budget_Index_ "Open Budget Index (0-100)"
label variable WBGI_Corruption_Control_ "Control of Corruption"
label variable WBGI_Govt_Effectiveness_ "Government Effectiveness"
label variable WBGI_Political_Stability_ "Political Stability and Absence of Violence/Terrorism"
label variable WBGI_Regulatory_Quality_ "Regulatory Quality"
label variable WBGI_Rule_of_Law_ "Rule of Law"
label variable WBGI_Accountability_ "Voice and Accountability"
label variable ICRG_Bureaucracy_Quality_ "Bureaucracy Quality (max points = 6)"
label variable ICRG_Corruption_ "Corruption (max points = 6)"
label variable ICRG_Democratic_Accountblty_ "Democratic Accountability"
label variable ICRG_Ethnic_Tensions_ "Ethnic Tensions (max points = 6)"
label variable ICRG_External_Conflict_ "External Conflict (max points = 12)"
label variable ICRG_Government_Stability_ "Government Stability (max points = 12)"
label variable ICRG_Internal_Conflict_ "Internal Conflict (max points = 12)"
label variable ICRG_Investment_Profile_ "Investment Profile (max points = 12)"
label variable ICRG_Law_and_Order_ "Law and Order (max points = 6)"
label variable ICRG_Military_in_Politics_ "Military in Politics (max points = 6)"
label variable ICRG_Religious_Tensions_ "Religious Tensions (max points = 6)"
label variable ICRG_Socioeconomic_Condtns_ "Socioeconomic Conditions (max points = 12)"
label variable Capital_Formation_ "Gross fixed capital formation (% of GDP)"
label variable Private_Credit_ "Domestic credit to private sector (% of GDP)"
label variable Financial_Credit_ "Domestic credit provided by financial sector (% of GDP)"
label variable Foreign_Direct_Investment_ "Foreign direct investment, net inflows (% of GDP)"
label variable Nonperforming_Loans_ "Bank nonperforming loans to total gross loans (%)"
label variable Market_Capitalization_ "Market capitalization of listed domestic companies (% of GDP)"
label variable Savings_excluding_emission_ "Adjusted net savings, excluding particulate emission damage (% of GNI)"
label variable Savings_including_emission_ "Adjusted net savings, including particulate emission damage (% of GNI)"
label variable Savings_CO2_damage_ "Adjusted savings: carbon dioxide damage (% of GNI)"
label variable Savings_education_ "Adjusted savings: education expenditure (% of GNI)"
label variable Savings_energy_depletion_ "Adjusted savings: energy depletion (% of GNI)"
label variable Savings_gross_adjusted_ "Adjusted savings: gross savings (% of GNI)"
label variable Savings_resource_depletion_ "Adjusted savings: natural resources depletion (% of GNI)"
label variable Savings_net_national_ "Adjusted savings: net national savings (% of GNI)"
label variable Savings_particulate_damage_ "Adjusted savings: particulate emission damage (% of GNI)"
label variable Gross_Savings_ "Gross savings (% of GNI)"
label variable Military_Expenditure_ "Military expenditure by country (% of GDP)"
label variable Arms_Imports_ "alue of arms deliveries and total trade by country, Arms imports as % of all imports"
label variable Bank_deposits_to_GDP_ "Bank deposits to GDP (%)"
label variable Bank_capital_total_assets_ "Bank capital to total assets (%)"
label variable Bank_concentration_ "Bank concentration (%)"
label variable Bank_credit_to_deposits_ "Bank credit to bank deposits (%)"
label variable Bank_nonperf_loans_to_gross_ "Bank nonperforming loans to gross loans (%)"
label variable Central_bank_assets_to_GDP_ "Central bank assets to GDP (%)"
label variable Deposit_banks_assets_GDP_ "Deposit money banks' assets to GDP (%)"
label variable Domestic_cred_private_GDP_ "Domestic credit to private sector (% of GDP)"
label variable Financial_deposits_to_GDP_ "Financial system deposits to GDP (%)"
label variable Foreign_bank_assets_total_ "Foreign bank assets among total bank assets (%)"
label variable Foreign_banks_total_banks_ "Foreign banks among total banks (%)"
label variable Private_credit_by_all_GDP_ "Private credit by deposit money banks and other financial institutions to GDP (%)"
label variable Private_credit_deposit_GDP_ "Private credit by deposit money banks to GDP (%)"
label variable Remittance_inflows_to_GDP_ "Remittance inflows to GDP (%)"
label variable Stock_market_capitalization_ "Stock market capitalization to GDP (%)"
label variable Stock_market_return_ "Stock market return (%, year-on-year)"
label variable Stock_market_value_traded_ "Stock market total value traded to GDP (%)"
label variable Stock_market_turnover_ratio_ "Stock market turnover ratio (%)"
label variable Stock_price_volatility_ "Stock price volatility"
label variable Total_factoring_volume_GDP_ "Total factoring volume to GDP (%)"
label variable Work_capital_financed_banks_ "Working capital financed by banks (%)"
label variable Dependency_ratio_ "WorldBank Development Indicators Age Dependency Ratio"


/* Governance Variebles:

ICRG_Bureaucracy_Quality_ 
ICRG_Corruption_ 
ICRG_Democratic_Accountblty_ 
ICRG_Ethnic_Tensions_ 
ICRG_External_Conflict_ 
ICRG_Government_Stability_ 
ICRG_Internal_Conflict_ 
ICRG_Investment_Profile_ 
ICRG_Law_and_Order_ 
ICRG_Military_in_Politics_ 
ICRG_Religious_Tensions_ 
ICRG_Socioeconomic_Condtns_

WBGI_Corruption_Control_ 
WBGI_Govt_Effectiveness_ 
WBGI_Political_Stability_ 
WBGI_Regulatory_Quality_ 
WBGI_Rule_of_Law_ 
WBGI_Accountability_
*/

save "/Users/hossainpazooki/Dropbox/Research/Hossain/Stata Codes/Stata dta files/Country_panel.dta", replace

