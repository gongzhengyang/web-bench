`gin vs axum`

`init`

```
$ make init
```

start service

```
$ make gin-server
$ make axum-server
```

benchmark

一万连接并发持续30秒

```
$ make axum
$ make gin
```

Intel(R) Core(TM) i7-9750H CPU @ 2.60GHz 6核12线

32g内存

cpu

```
gin: 
mem: 10M  --->   150 ~ 200 M
cpu: 0 ---> 400%

axum: 
mem: 2.75M ---> 15 ~ 20 M
cpu: 0 ~ 300%
```

gin

```
oha -z 30s -c 10000 --latency-correction --disable-keepalive http://127.0.0.1:8080/ping
Summary:
  Success rate: 100.00%
  Total:        30.0042 secs
  Slowest:      0.9334 secs
  Fastest:      0.0009 secs
  Average:      0.2682 secs
  Requests/sec: 36765.5071

  Total data:   18.94 MiB
  Size/request: 18 B
  Size/sec:     646.27 KiB

Response time histogram:
  0.001 [1]      |
  0.094 [223940] |■■■■■■■■■■■■■■■■■
  0.187 [48573]  |■■■
  0.281 [398960] |■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
  0.374 [145663] |■■■■■■■■■■■
  0.467 [188054] |■■■■■■■■■■■■■■■
  0.560 [80317]  |■■■■■■
  0.654 [15327]  |■
  0.747 [2160]   |
  0.840 [102]    |
  0.933 [23]     |

Response time distribution:
  10% in 0.0621 secs
  25% in 0.2044 secs
  50% in 0.2615 secs
  75% in 0.3975 secs
  90% in 0.4627 secs
  95% in 0.4888 secs
  99% in 0.5849 secs

Details (average, fastest, slowest):
  DNS+dialup:   0.1302 secs, 0.0001 secs, 0.5874 secs
  DNS-lookup:   0.0000 secs, 0.0000 secs, 0.0191 secs

Status code distribution:
  [200] 1103120 responses
```

axum

```
oha -z 30s -c 10000 --latency-correction --disable-keepalive http://127.0.0.1:9999/ping
Summary:
  Success rate: 100.00%
  Total:        30.0037 secs
  Slowest:      17.6591 secs
  Fastest:      0.0002 secs
  Average:      0.2251 secs
  Requests/sec: 39574.5420

  Total data:   20.38 MiB
  Size/request: 18 B
  Size/sec:     695.65 KiB

Response time histogram:
   0.000 [1]       |
   1.766 [1162008] |■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
   3.532 [19025]   |
   5.298 [1088]    |
   7.064 [150]     |
   8.830 [4497]    |
  10.596 [86]      |
  12.361 [5]       |
  14.127 [35]      |
  15.893 [448]     |
  17.659 [39]      |

Response time distribution:
  10% in 0.0030 secs
  25% in 0.0039 secs
  50% in 0.0055 secs
  75% in 0.0092 secs
  90% in 1.0246 secs
  95% in 1.0457 secs
  99% in 3.0544 secs

Details (average, fastest, slowest):
  DNS+dialup:   0.2033 secs, 0.0000 secs, 15.4963 secs
  DNS-lookup:   0.0000 secs, 0.0000 secs, 0.0147 secs

Status code distribution:
  [200] 1187382 responses
```

