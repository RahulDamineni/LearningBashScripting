#!/bin/bash

echo There are two ways we could perform arithmatic ops
echo i.  using expr: expr num op num $(expr $1 \* $2)
echo ii. using parathesis: $(($1 * $2))

echo And today\'s date is $(($(date)))
