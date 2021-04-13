#!/bin/bash
set -xe

oc exec -it $1 -- go tool pprof \-top \-cum http://localhost:6060/debug/pprof/heap
oc cp openshift-file-integrity/$1:/root/pprof/pprof.file-integrity-operator.alloc_objects.alloc_space.inuse_objects.inuse_space.001.pb.gz ./pprof-$(date +%s)-$1.pb.gz
oc exec -it $1 -- rm -f /root/pprof/pprof.file-integrity-operator.alloc_objects.alloc_space.inuse_objects.inuse_space*
