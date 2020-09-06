BASE="/home/ksi"
ISO=$BASE"/Downloads/CentOS-7-x86_64-Minimal-1611/CentOS-7-x86_64-Minimal-1611.iso"

qemu-system-x86_64 -cdrom $ISO -boot order=d -drive file=centos.img,format=raw -m 768M -enable-kvm -machine pc,accel=kvm -net nic -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time



