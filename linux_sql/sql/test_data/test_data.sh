-- Test data for host_info
# shellcheck disable=SC1036
INSERT INTO PUBLIC.host_info (
hostname,cpu_number,cpu_architecture,cpu_model,cpu_mhz,l2_cache,total_mem)
VALUES
('host-1.us-east1-c.c.jarvis-training-12341234.internal',
2,
'x86_64',
'Intel(R) Xeon(R) CPU @ 2.30GHz',
2200.23,
256,
8877065),
('host-2.us-east1-c.c.jarvis-training-12341234.internal',
1,
'x86_64',
'Intel(R) Xeon(R) CPU @ 2.30GHz',
2200.23,
256,
9657065),
('host-3.us-east1-c.c.jarvis-training-12341234.internal',
2,
'x86_64',
'Intel(R) Xeon(R) CPU @ 2.30GHz',
2200.23,
256,
5689065);

-- Test data for host_usage
INSERT INTO PUBLIC. host_usage(timestamp, host_id, memory_free, cpu_idle, cpu_kernel, disk_io, disk_available)
VALUES
('2021-12-09 12:39:00',1,7894,77,80, 1,12345),
('2021-12-09 12:40:00',2,4561,77,80, 1,12345),
('2021-12-09 12:41:00',3,8521,77,80, 1,12345),
('2021-12-09 12:42:00',4,1239,77,80, 1,12345),
('2021-12-09 12:43:00',5,5674,77,80, 1,12345),
('2021-12-09 12:45:00',6,9546,77 ,80, 1,12345),
('2021-12-09 12:46:00',7,7854,77,80, 1,12345),
('2021-12-09 12:47:00',8,9658,77,80, 1,12345),
('2021-12-09 12:48:00',9,5267,77,80, 1,12345),
('2021-12-09 12:49:00',10,9768,77,80, 1,12345),
('2021-12-09 12:50:00',11,1568,77,80, 1,12345),
('2021-12-09 12:51:00',11,4569,77,80, 1,12345),
('2021-12-09 12:52:00',12 ,8569,77,80, 1,12345)
; 
