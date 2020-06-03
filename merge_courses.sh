#!/usr/bin/env bash

detox -v ./*
pdftk $(ls -ltrC1) cat output merged.pdf
