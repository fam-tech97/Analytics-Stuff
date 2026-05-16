with no_spaces as (
select 
replace(replace(value, ',', ''),'.','') as word
from google_file_store
CROSS APPLY string_split(contents,' ')
)

select 
word,
count(word) as ocurrences
from no_spaces
group by word