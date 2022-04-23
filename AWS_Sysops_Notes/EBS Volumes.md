## Introduction
**Elastic Block Store**
- Storage vols that you can attach to EC2 instances.
	- Pret much a harddrive.  You can use it as db, os, whatever.
	- Automatically replicated in a single AZ.
	- Scalable --- dynamic scaling, or change type volume.  No downtime for those!

## Types

- **General Purpose SSD (gp2)**
	- Good for boot disks, volumes, or dev and test apps that are not latency sensitive.
- **Provisioned IOPS SSD (io1)**
	- If you need more than 16k IOPS.
	- Latency Sensitive apps.
	- High performance option (most expensive).
- **Provisioned IOPS SSD (io2)**
	- Latest Gen of io things.
	- Higher durability and more IOPS.
	- Same price as io1.  
	- Maybe deprecating io1?
	- Latency Sensitive apps. 
- **Throughput Optimized HDD (st1)**
	- Low-cost HDD Volume.
	- Baseline 40MB/s per TB.
	- ETL, Log processing, "big data", data warehouse.
	- *Can't be a boot volume.*
- **Cold HDD (sc1)**
	- Lowest cost option.
	- 12 MB/s per TB.
	- Good for colder data, requiring fewer scans per day.
	- Good for apps that need a lower cost and performance is not a factor.
	- *Cannot be a boot volume.*

