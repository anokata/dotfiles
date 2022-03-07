ISO="~/Downloads/Win7.SP1.x86-x64.Rus-Eng.18in1.IE11+.Activated.v4/ru-en_win7_sp1_ie11+_x86-x64_18in1_activated_v4.iso "
qemu-system-x86_64 -cdrom $ISO -boot order=c -drive file=win.img,format=raw -m 1G -enable-kvm -machine pc,accel=kvm -net nic -net user,smb=/media/ksi/data/win/shared -cpu host,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time
