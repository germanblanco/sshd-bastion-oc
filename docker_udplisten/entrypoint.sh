#!/bin/bash

set -e

socat UDP4-LISTEN:6343,fork TCP4:127.0.0.1:6343
