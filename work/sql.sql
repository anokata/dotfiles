select m,k from 
    (select n, m from (
        select 1 as n ,'a' as m
        union all 
        select 2 as n ,'b' as m
        union all 
        select 3 as n ,'c' as m
    ) as q) as t
    inner join 
    (select k,i from (
        select 2 as i, '#' as k
        union all 
        select 3 as i, '@' as k
        union all 
        select 1 as i, '$' as k
    ) as r) as s
    on n = i
;
