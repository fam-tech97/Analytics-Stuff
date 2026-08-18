with sents as (
    select
        date,
        user_id_sender,
        user_id_receiver
    from fb_friend_requests
    where action = 'sent'
),

accepteds as (
    select
        date,
        user_id_sender,
        user_id_receiver
    from fb_friend_requests
    where action = 'accepted'
)

select
    S.date as date,
    count(A.user_id_receiver) / cast(count(S.user_id_sender) as decimal) as percentage_acceptance
from accepteds A
right join sents S on S.user_id_sender = A.user_id_sender
and S.user_id_receiver = A.user_id_receiver
group by S.date