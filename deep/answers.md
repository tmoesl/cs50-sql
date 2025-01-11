# From the Deep

AquaByte plans to distribute its six observations across a network of boats (Boat A, B, and C) to increase storage capacity beyond what a single boat could handle. However, adding more boats, acting as nodes, introduces complexity: without relocating data after it’s stored, AquaByte must decide how to assign each observation to a specific boat—a challenge that involves effective data partitioning.

## Random Partitioning

Advantages: Balances storage and processing load across nodes, minimizing data skew and ensuring even distribution, making it ideal for scaling large datasets.

Disadvantages: Increases query complexity and resource usage, as all nodes may need to be queried for complete dataset access, potentially impacting performance due to added network communication. If any node is unavailable, queries may return incomplete data, increasing the likelihood of partial query failures.

## Partitioning by Hour

Advantages: Hour-based partitioning distributes data by time, enabling efficient, targeted queries for specific hours and reducing load on other nodes by limiting the scan to relevant partitions (time-bounded queries).

Disadvantages: This method risks uneven data distribution if observations are concentrated in certain hours, leading to potential overloads and hotspots. Additionally, if certain time-specific partitions become bottlenecks due to high demand, node unavailability could result in incomplete query results.


## Partitioning by Hash Value

Advantages: Hash-based partitioning ensures an even distribution of data across nodes, preventing any single node from becoming overloaded. It is deterministic, providing predictable data location, which optimizes query routing for single-value lookups.

Disadvantages: Hash values are not aligned with time intervals, complicating time-based queries. Retrieving data over a time range may require scatter-gather operations across multiple nodes, increasing network load. If a node is unavailable, data retrieval may be incomplete as specific hash ranges would be inaccessible.
