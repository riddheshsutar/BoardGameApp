#!/usr/bin/env bash
set -euo pipefail
mvn -B clean package
java -jar target/*.jar
