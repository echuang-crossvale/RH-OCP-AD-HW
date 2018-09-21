#!/usr/bin/env bash

oc new-project smoke-test
oc new-app nodejs-mongo-persistent

