#!/bin/bash

circleci config pack src > orb.yml
circleci orb publish orb.yml woltsu/telegram@dev:alpha
rm -rf orb.yml