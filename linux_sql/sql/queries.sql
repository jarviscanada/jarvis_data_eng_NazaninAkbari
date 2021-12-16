-- Group hosts by hardware info
select
    cpu_number, id as host_id,
    total_mem
from host_info
group by cpu_number, id
order by total_mem DESC;

-- Round of the TimeStamp with 5 minutes interval.
CREATE FUNCTION RoundTimeStamp(ts timestamp) RETURNS timestamp AS 
$ $ 
BEGIN 
        RETURN date_trunc('hour', ts) + date_part('minute', ts) :: int / 5 * interval '5 min';

END;

$ $ 
LANGUAGE PLPGSQL;

-- Return Average Memory usage
SELECT
    host_id, hostInfo.hostname,
    RoundTimeStamp(hostUsage.timestamp) AS timestamp,
    cast(AVG((hostInfo.total_mem - hostUsage.memory_free) * 100 / total_mem) AS int) avg_used_mem_percentage
from host_info hostInfo
    inner join host_usage hostUsage on hostInfo.id = hostUsage.host_id
group by RoundTimeStamp(hostUsage.timestamp), host_id, hostname;

-- Retreiving server details failing to insert 3 rows in a 5 minutes interval.
SELECT
    DISTINCT host_id,
    RoundTimeStamp(host_usage.timestamp) as timeStamps,
    COUNT(*) as points
FROM host_usage
GROUP BY timeStamps, host_id
HAVING COUNT(*) <= 3;
