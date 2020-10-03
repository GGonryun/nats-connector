# nats-connector
An OpenFaaS event-connector to trigger functions from NATS.
## Deploy on Kubernetes

The following instructions show how to run and test `nats-connector` on Kubernetes.

1. Deploy the connector with:

   ```bash
   kubectl apply -f https://github.com/GGonryun/nats-connector/blob/master/yaml/kubernetes/connector-dep.yaml
   ```

2. Verify that the receiver was invoked by checking the logs

   ```bash
   faas-cli logs <fn_name>

   ```

## Building
Build and release is done via CI, but you can also build your own version locally.

```bash
export TAG=0.2.1
make publish
```

### Configuration

Configuration is by environment variable, which can be set in the Kubernetes YAML file: [yaml/kubernetes/connector-dep.yaml](./yaml/kubernetes/connector-dep.yaml)

| Variable             | Description                   |  Default                                        |
| -------------------- | ------------------------------|--------------------------------------------------|
| `topics`             | Delimited list of topics    |  `nats-test,`                                   |
| `broker_host`        | The host, but not the port for NATS | `nats` |
| `async-invocation`   | Queue the invocation with the built-in OpenFaaS queue-worker and return immediately    |  `false` |
| `gateway_url`        | The URL for the OpenFaaS gateway | `http://gateway:8080` |
| `upstream_timeout`   | Timeout to wait for synchronous invocations | `60s` |
| `rebuild_interval`   | Interval at which to rebuild the map of topics <> functions | `5s`  |
| `topic_delimiter`    | Used to separate items in `topics` variable | `,` |
