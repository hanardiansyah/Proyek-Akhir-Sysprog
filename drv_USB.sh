#!/bin/bash
UID=$(id -u)
if [ x$UID != x0 ] 
then
    #Beware of how you compose the command
    printf -v cmd_str '%q ' "$0" "$@"
    exec sudo su -c "$cmd_str"
fi
bind() {
  echo "$1" > /sys/bus/usb/drivers/usb/bind
}

unbind() {
  echo "$1" > /sys/bus/usb/drivers/usb/unbind
}

usb_binded=()
usb_unbinded=()

for i in /sys/bus/usb/drivers/usb/* ; do
	if [ -d "$i" ]; then
		usb_binded+=($(basename "$i"))
	fi
done

#echo ${usb_binded[*]}

while :
	do
		echo "================================="
		echo "Hello, what do you want to do?"
		echo "================================="
		echo "1. View binded USB devices"
		echo "2. Bind a USB device"
		echo "3. Unbind a USB device"
		echo "4. Exit"

		read -p "Input: " command

		if [ $command = "1" ]; then
			echo "USB Devices:"
			for i in /sys/bus/usb/drivers/usb/* ; do
  				if [ -d "$i" ]; then
    					echo "[$(basename $i)] ProductId: $(cat $i/idProduct); VendorId: $(cat $i/idVendor)"
  				fi
			done

			#lsusb

		elif [ $command = "2" ]; then
			if [ ${#usb_unbinded[@]} = 0 ]; then
				echo "No USBs available to be binded"
			else
				echo "USB Devices available to bind:"
                               	for i in ${usb_unbinded[@]} ; do
                               		echo $i
                               	done

				read -p "Which USB do you want to bind? " usb_num
				echo "Binding $usb_num ..."
				bind $usb_num
				usb_binded+=($usb_num)

				x=0
				for  i in ${usb_unbinded[@]}}; do
					if [ $usb_num = $i ]; then
                                                unset usb_unbinded[$x]
                                                break
                                        fi
                                        x=$((x+1))
				done

				#usb_binded
				echo "Successfully binded $usb_num!"
			fi

		elif [ $command = "3" ]; then
			if [ ${#usb_binded[@]} = 0 ]; then
				echo "No USBs available to be unbinded"
                        else
				echo "USB devices availabe to unbind:"
                                for i in ${usb_binded[@]}; do
                                	echo $i
	                	done

				read -p "Which USB do you want to unbind? " usb_num

				echo "Unbinding $usb_num ..."
				unbind $usb_num
				usb_unbinded+=($usb_num)

				x=0
				for  i in ${usb_binded[@]}; do
					if [ $usb_num = $i ]; then
						unset usb_binded[$x]
						break
					fi
					x=$((x+1))
                                done

				#echo ${usb_unbinded[*]}
				#echo ${usb_binded[*]}

        			echo "Successfully unbinded $usb_num!"
			fi

		elif [ $command = "4" ];
			then
        			break
		else
			echo "Wrong command! Please try again"
		fi
	done
