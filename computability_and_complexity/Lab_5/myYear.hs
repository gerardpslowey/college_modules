-- a function that, given a date, tells you the day of the week for that date

-- Weekdays should be defined using an enumerated type with possible values:
data Day = Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday
    -- belong to the type classes Enum and Show
    deriving(Enum, Show)

-- Months should also be defined using an enumerated type with possible values:
data Month = Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec
    -- belong to the type classes Enum and Read
    deriving(Enum, Read)

-- Month days and years should be represented using Int
-- Dates should be represented as a tuple.
-- format: (monthday, month, year)
type Date = (Int,Month,Int)

-- determines if a given year is a leap year:
leap :: Int -> Bool
leap year
    -- A year which is divisible by 100 is only a leap year 
    -- if it is also divisible by 400.
    | year `mod` 100 == 0 = year `mod` 400 == 0
    -- A year is a leap year if it is divisible by 4, 
    -- unless it is also divisible by 100. 
    | year `mod` 4 == 0 = True
    | otherwise         = False

-- takes a year and returns a list containing the number of days in each month of that year
mLengths :: Int -> [Int]
mLengths year = [31,feb,31,30,31,30,31,31,30,31,30,31]
    where feb = if leap year then 29 else 28

-- function numDays that, when given a date, 
-- returns the number of days since 31st December 1752
numDays :: Date -> Int
numDays (day,month,year)
    -- days so far this month
    = day 
    -- days this year
    --
    -- sum: computes the sum of elements in the list
    -- take: creates a list, the first argument determines, how many items should be taken from the list passed as the second argument
    -- fromEnum: returns the argument position in an enumeration
    -- mLengths: retuns the number of days in each month (as above)
    + sum (take (fromEnum month) (mLengths year))
    -- days since adoption of Gregorian calendar
    -- 
    -- years since 1975 * 365 days
    -- plus number of years from 
    + (year-1753) * 365 + length [yr | yr <- [1753 .. year-1], leap yr] 

-- when given a date, returns the day of the week on that date. 
dayOfWeek :: Date -> Day
dayOfWeek day = toEnum (((numDays day) - 1) `mod` 7)