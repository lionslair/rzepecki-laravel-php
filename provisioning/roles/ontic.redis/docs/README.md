# Documentation

## Example

```
redis_ppa: 'ppa:chris-lea/redis-server'
redis_port: '6379'
redis_bind: '127.0.0.1 192.168.0.10'
```

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](/defaults/main.yml)):

```
redis_ppa:
redis_enable_repo: ''
redis_service_state: 'started'
redis_service_enabled: yes
redis_conf_template: 'redis.conf.j2'
redis_packages:
redis_daemonize: 'yes'
redis_password: false
redis_port: '6379'
redis_bind: '127.0.0.1'
redis_pidfile: '/var/run/redis/{{ redis_service_name }}.pid'
redis_logfile: '/var/log/redis/{{ redis_service_name }}.log'
redis_loglevel: 'notice'
redis_tcp_backlog: '511'
redis_unixsocket: false
redis_timeout: '0'
redis_tcp_keepalive: '0'
redis_syslog_enabled: 'no'
redis_syslog_ident: 'redis'
redis_syslog_facility: 'local0'
redis_databases: '16'
redis_save:
  - '900 1'
  - '300 10'
  - '60 10000'
redis_stop_writes_on_bgsave_error: 'yes'
redis_rdbcompression: 'yes'
redis_rdbchecksum: 'yes'
redis_dbfilename: 'dump.rdb'
redis_dir: '/var/lib/redis'
redis_slaveof: false
redis_slave_serve_stale_data: 'yes'
redis_slave_read_only: 'yes'
redis_repl_diskless_sync: 'no'
redis_repl_diskless_sync_delay: '5'
redis_repl_ping_slave_period: '10'
redis_repl_timeout: '60'
redis_repl_disable_tcp_nodelay: 'no'
redis_repl_backlog_size: false
redis_repl_backlog_ttl: false
redis_slave_priority: '100'
redis_min_slaves_to_write: '0'
redis_min_slaves_max_lag: '10'
redis_maxclients: '10000'
redis_maxmemory: '0'
redis_maxmemory_policy: 'noeviction'
redis_maxmemory_samples: '5'
redis_appendonly: 'no'
redis_appendfilename: 'appendonly.aof'
redis_appendfsync: 'everysec'
redis_no_appendfsync_on_rewrite: 'no'
redis_auto_aof_rewrite_percentage: '100'
redis_auto_aof_rewrite_min_size: '64mb'
redis_aof_load_truncated: 'yes'
redis_lua_time_limit: '5000'
redis_slowlog_log_slower_than: '10000'
redis_slowlog_max_len: '128'
redis_latency_monitor_threshold: '0'
```

## Todo

Complete documentation!