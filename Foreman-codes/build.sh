#!/bin/bash
hammer -u admin -p redhat  host create --name $1  --compute-resource-id=1 --hostgroup-id=2
hammer -u admin -p redhat  host start --name $1.testlab.local

