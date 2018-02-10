dims(){

if [ $# -gt 1 ]; then

	echo "Argument count is greater than 1" >&2

	return 1

else

	temp=$(wc -l $1 2> /dev/null)

	if [ $? -eq 0 ]; then

		rows=$(wc -l $1 2> /dev/null | cut -d " " -f 1 2> /dev/null)

		echo -n $rows" "

		temp=$(head -n 1 $1 2> /dev/null)

		if [ $? -eq 0 ]; then

			cols=$(head -n 1 $1 2> /dev/null | awk '{print NF}')

			echo $cols

		else

			echo "No such file" >&2

			return 1

		fi

	else

		echo "No such file" >&2

		return 1

	fi

fi

}



add(){

if [ $# -gt 2 ]; then

	echo "Argument count is greater than 2" >&2

	return 1

else

	temp=$(wc -l $1 2> /dev/null)

	if [ $? -eq 0 ]; then

		rows=$(wc -l $1 2> /dev/null | cut -d " " -f 1 2> /dev/null)

		cols=$(head -n 1 $1 2> /dev/null | awk '{print NF}')

		temp1=$(wc -l $2 2> /dev/null)

		if [ $? -eq 0 ]; then

			rows1=$(wc -l $2 2> /dev/null | cut -d " " -f 1 2> /dev/null)

			cols1=$(head -n 1 $2 2> /dev/null | awk '{print NF}')

			if [ $rows -eq $rows1 -a $cols -eq $cols1 ]; then

				filename=$1
				i=0
				while read Line
				do
					for j in $(seq 0 $cols)
					do
						stringarray=($Line)
						a[(($cols*$i + $j))]=${stringarray[j]}
					done
					i=$((i+1))
				done < $filename
				filename=$2
				i=0
				while read Line
				do
					for j in $(seq 0 $cols1)
					do
						stringarray=($Line)
						b[(($cols1*$i + $j))]=${stringarray[j]}
					done
					i=$((i+1))
				done < $filename
				l=0
				for k in ${a[*]}
				do
					temp=${b[((l))]}
					c[((l))]=$((k + temp))
					l=$((l+1))
				done
				for m in $(seq 0 $rows)
				do
					for n in $(seq 0 $cols)
					do
						echo -en "${c[(($cols*$m + $n))]}\t"
					done
					echo ""
				done
			else

				echo "Dimensions are not equal" >&2

			fi

		else

			echo "No such file" >&2

			return 1

		fi

	else

		echo "No such file" >&2

		return 1

	fi
fi

}



transpose(){

}

if [ "$1" == "dims" ]; then

	$1 "${@:2}"

elif [ "$1" == "add" ]; then

	$1 "${@:2}"

fi
