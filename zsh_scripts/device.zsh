speaker_id=$(pw-cli info alsa_output.pci-0000_2b_00.1.hdmi-stereo-extra3 | head -n 1 | awk '{print $2}')
headset_id=$(pw-cli info alsa_output.pci-0000_2d_00.4.analog-stereo | head -n 1 | awk '{print $2}')
bheadset_id=$(pw-cli info bluez_output.94_4B_F8_43_3D_2E.1 | head -n 1 | awk '{print $2}')


if [ "$1" = 'speaker' ]; then
	wpctl set-default "$speaker_id"
elif [ "$1" = 'headset' ]; then
	wpctl set-default "$headset_id"
elif [ "$1" = 'bheadset' ]; then
	wpctl set-default "$bheadset_id"
else
	echo 'Unrecognized device name' >&2
	exit 2
fi
