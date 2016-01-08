#!/bin/bash

vagrant_cmd() {
  vagrant ssh -c"$@" 2>/dev/null
}
