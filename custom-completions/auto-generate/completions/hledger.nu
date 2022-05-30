# Anonymize accounts and payees
extern "hledger" [

	...args
]

# Add transactions using guided prompts
extern "hledger add" [
	--no-new-accounts					# Don’t allow creating new accounts
	...args
]

# Add new transactions from other files
extern "hledger import" [
	--dry-run					# Just show the transactions to be imported
	...args
]

# Ensure transactions are ordered by date
extern "hledger check-dates" [
	--strict					# Makes date comparing strict
	...args
]

# Ensure accounts have different leaf names
extern "hledger check-dupes" [

	...args
]

# Generate balance-resetting transactions
extern "hledger close equity" [

	...args
]

# Generate automated postings/diffs
extern "hledger rewrite" [
	--add-posting					# Add a posting to account
	--diff					# Generate diff suitable for patch(1)
	...args
]

# Show assets, liabilities, and net worth
extern "hledger balancesheet       bs" [

	...args
]

# Show assets, liabilities, and equity
extern "hledger balancesheetequity bse" [

	...args
]

# Show changes in liquid assets
extern "hledger cashflow           cf" [

	...args
]

# Show revenues and expenses
extern "hledger incomestatement    is" [

	...args
]

# Select an output format
extern "hledger txt csv html" [

	...args
]

# Show return on investments
extern "hledger roi" [
	--cashflow					# Show all amounts that were used to compute returns
	...args
]

# Show account names
extern "hledger accounts" [
	--declared					# Show account names declared with account directives
	--used					# Show account names referenced by transactions
	--tree					# Show short account names as a tree
	--flat					# Show short account names as a list
	...args
]

# Show postings-per-interval bar charts
extern "hledger activity" [

	...args
]

# Show balance changes/end balances/budgets in accounts
extern "hledger balance" [
	--change					# Show balance change in each period
	--cumulative					# Show balance change accumulated across periods
	--historical(-H)					# Show historical ending balance in each period
	--tree					# Show accounts as a tree
	--flat					# Show accounts as a list
	--average(-A)					# Show a row average column in multicolumn reports
	--row-total(-T)					# Show a row total column in multicolumn reports
	--no-total(-N)					# Omit the final row
	--no-elide					# Don’t squash boring parent accounts in tree mode
	--pretty-tables					# Use Unicode when displaying tables
	--sort-amount(-S)					# Sort by amount instead of account code/name
	--budget					# Show performance compared to budget goals defined by periodic transactions
	--invert					# Display all amounts with reversed sign
	--transpose					# Transpose rows and columns
	...args
]

# Show commodity/currency symbols
extern "hledger commodities" [

	...args
]

# Show input file paths
extern "hledger files" [

	...args
]

# Show market-price records
extern "hledger prices" [
	--costs					# Print transaction prices from postings
	--inverted-costs					# Print transaction inverted prices from postings also
	...args
]

# Show transactions
extern "hledger print txns" [
	--explicit(-x)					# Show all amounts explicitly
	--new					# Show only newer-dated transactions added in each file since last run
	...args
]

# Show only transactions with unique descriptions
extern "hledger print-unique" [
	--explicit(-x)					# Show all amounts explicitly
	--new					# Show only newer-dated transactions added in each file since last run
	...args
]

# Show postings in one or more accounts & running total
extern "hledger register" [
	--cumulative					# Show running total from report start date
	--historical(-H)					# Show historical running total/balance
	--average(-A)					# Show running average of posting amounts instead of total (implies --empty)
	--related(-r)					# Show postings’ siblings instead
	--invert					# Display all amounts with reversed sign
	...args
]

# Show a recent posting that best matches a description
extern "hledger register-match" [

	...args
]

# Show journal statistics
extern "hledger stats" [

	...args
]

# Show tag names
extern "hledger tags" [

	...args
]

# Run self-tests
extern "hledger test" [

	...args
]

# Show hledger manual list
extern "hledger help" [

	...args
]