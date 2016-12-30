#!/bin/bash

echo "################# First Part #################"
prove -vvv t/tests_part_1.t

echo -e "\n\n"
echo "################# Second Part #################"
prove -vvv t/tests_part_2.t
