#! /bin/bash

function remind {
  notify-send -t 15 "drink water"
  sleep 15m
  remind
}

remind
