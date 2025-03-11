#!/bin/bash

set -e

socat -b1000000 UDP4-LISTEN:6343,fork TCP4:127.0.0.1:6343
