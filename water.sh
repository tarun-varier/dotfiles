#! /bin/bash

function remind {
  notify-send -t 300000 "drink water"
  sleep 15m
  remind
}

remind
