select
user_id,
friend_id
from google_friends_network
union
select
friend_id,
user_id
from google_friends_network