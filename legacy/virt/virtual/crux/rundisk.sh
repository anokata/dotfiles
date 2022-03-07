BASE="/home/ksi"
ISO=$BASE"/Downloads/crux-3.3/iso/crux-3.3.iso"

qemu-system-x86_64 -cdrom $ISO -boot order=c -drive file=linux.img,format=raw -m 768M -enable-kvm -machine pc,accel=kvm -net nic -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time
