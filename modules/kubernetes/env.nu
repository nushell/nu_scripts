export-env {
    $env.KUBERNETES_SCHEMA_URL = $"file:///($env.HOME)/.config/kubernetes-json-schema/all.json"
    $env.KUBERNETES_RESOURCE_ABBR = {
        s: services
        d: deployments
        p: pods
    }
    let id = {
        name: [metadata name]
        kind: [kind {|x|$x| str downcase}]
        apiVersion: [apiVersion]
        labels: [metadata labels]
        created: [metadata creationTimestamp {|x|$x | into datetime}]
    }
    let ids = {...$id, namespace: [metadata namespace] }
    $env.KUBERNETES_REFINE = {
        _namespace: [
            kube-system kube-node-lease kube-public
            kube-flannel istio-system ingress-nginx
        ]
        shortnames: {
            sc: storageclasses
            ing: ingresses
            vs: virtualservices
            gw: gateways.networking.istio.io
            gtw: gateways
            dr: destinationrules
            ev: events
            cj: cronjobs
            hpa: horizontalpodautoscalers
            sts: statefulsets
            rs: replicasets
            deploy: deployments
            ds: daemonsets
            crd: customresourcedefinitions
            svc: services
            sa: serviceaccounts
            quota: resourcequotas
            rc: replicationcontrollers
            po: pods
            pv: persistentvolumes
            pvc: persistentvolumeclaims
            no: nodes
            ns: namespaces
            ep: endpoints
            cm: configmaps
        }
        cluster_resources: {
            namespaces: {
                ...$id
            }
        }
        cluster_status: {

        }
        status: {
            deployments: {
                conditions: {
                    _: [status conditions]
                    type: [type]
                    reason: [reason]
                    message: [message]
                }
            }
            pods: {
                ...$ids
                image: [spec containers image]
                containers: {
                    _: [spec containers]
                    name: [name]
                    image: [image]
                    serviceAccount: [serviceAccount]
                    env: [env]
                    args: [args]
                    ports: [ports]
                    volumeMounts: [volumeMounts]
                    node: [nodeName]
                    nodeSelector: [nodeSelector]
                }
                hostIP: [status hostIP]
                podIP: [status podIP]
                phase: [status phase]
                startTime: [status startTime]
                conditions: {
                    _: [status conditions]
                    type: [type]
                    reason: [reason]
                    message: [message]
                }
            }
        }
        resources: {
            deployments: {
                ...$ids
                replicas: [spec replicas]
                containers: {
                    _: [spec template spec containers]
                    name: [name]
                    labels: [metadata labels]
                    image: [image]
                    imagePullPolicy: [imagePullPolicy]
                    env: [env]
                    ports: [ports]
                    resources: [resources]
                    args: [args]
                    label: [label]
                    replicas: [replicas]
                }
            }
            services: {
                ...$ids
                type: [spec type]
                clusterIP: [spec clusterIP]
                ports: [spec ports]
                selector: [spec selector]
                sessionAffinity: [sessionAffinity]
            }
            configmaps: {
                ...$ids
                data: [data]
            }
            secrets: {
                ...$ids
                data: [data]
                type: [type]
            }
            gateways: {
                ...$ids
                addresses: [spec addresses]
                gatewayClassName: [spec gatewayClassName]
                listeners: {
                    _: [spec listeners]
                    name: [name]
                    hostname: [hostname]
                    port: [port]
                    protocol: [protocol]
                    tls: [tls]
                }

            }
            httproutes: {
                ...$ids
                hostnames: [spec hostnames]
                parentRefs: [spec parentRefs name]
                rules: {
                    _: [spec rules]
                    backend: {
                        _: [backendRefs]
                        name: [name]
                        port: [port]
                        weight: [weight]
                    }
                    matches: {
                        _: [matches]
                        type: [path type]
                        value: [path value]
                    }

                }
            }
            virtualservices.networking.istio.io: {
                ...$ids
                http: [spec http]
                gateways: {
                    _: [spec gateways]
                    hosts: {
                        _: [spec hosts]
                    }
                }
            }
            gateways.networking.istio.io: {
                ...$ids
                selector: [spec selector]
                servers: [spec servers]

            }
            ingresses: {
                ...$ids
                annotations: [metadata annotations]
                rules: {
                    _: [spec rules]
                    host: [host]
                    http: [http]
                }
            }
        }
    }
}
