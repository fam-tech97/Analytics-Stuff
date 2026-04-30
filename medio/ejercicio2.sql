with sent_cte as (
    select
        date,
        user_id_sender,
        user_id_receiver
    from fb_friend_requests
    where action = 'sent'
),
accepted_cte as (
    select
        date,
        user_id_sender,
        user_id_receiver
    from fb_friend_requests
    where action = 'accepted'
)

SELECT a.date,
       count(b.user_id_receiver)/CAST(count(a.user_id_sender) AS decimal) AS percentage_acceptance
FROM sent_cte a
LEFT JOIN accepted_cte b ON a.user_id_sender=b.user_id_sender
AND a.user_id_receiver=b.user_id_receiver
GROUP BY a.date
