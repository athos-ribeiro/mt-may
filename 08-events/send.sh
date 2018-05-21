#!/bin/bash

sleep 30
while true; do
  amqp-publish -r 'mtech' -b $MTECH_MSG -u $AMPQ_ADDRESS
  sleep 3
done
