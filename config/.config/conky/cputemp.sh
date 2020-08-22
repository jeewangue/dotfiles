#! /usr/bin/env bash
cputemp=$(sensors -j | jq '.[]."Core 0" | select(. != null) | with_entries(if (.key|test(".*input")) then {key: "temp", value: .value} else empty end) | .temp')

if [ $cputemp -ge 90 ]
then
	echo "\${color9}+${cputemp}.0°C\${color}"
elif [ $cputemp -ge 70 ]
then
	echo "\${color8}+${cputemp}.0°C\${color}"
else
	echo "\${color7}+${cputemp}.0°C\${color}"
fi

