#!/bin/bash

pkill -HUP -f "cinnamon --replace"
export DISPLAY=:0.0; cinnamon
