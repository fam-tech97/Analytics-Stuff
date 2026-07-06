with sents as (
    select
        date,
        user_id_sender,
        user_id_receiver
    from fb_friend_requests
    where action = 'sent'
),

accepted as (
    select
        date,
        user_id_sender,
        user_id_receiver
    from fb_friend_requests
    where action = 'accepted'
)

select
S.date,
count(A.user_id_receiver)/CAST(count(S.user_id_sender) AS decimal) AS percentage_acceptance
from sents S
left join accepted A
on S.user_id_sender = A.user_id_sender
and S.user_id_receiver = A.user_id_receiver
group by S.date