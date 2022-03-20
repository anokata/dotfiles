echo "backup recovery"
dd if=/dev/recovery of=/storage/sdcard1/backup/recovery
echo "backup boot 0"
dd if=/dev/block/mmcblk0boot0 of=/storage/sdcard1/backup/boot0
echo "backup boot 1"
dd if=/dev/block/mmcblk0boot1 of=/storage/sdcard1/backup/boot1
echo "backup preload"
dd if=/dev/block/mmcblk0p4 of=/storage/sdcard1/backup/preload 
echo "backup protect f"
dd if=/dev/block/mmcblk0p2 of=/storage/sdcard1/backup/protect_f
echo "backup protect s"
dd if=/dev/block/mmcblk0p3 of=/storage/sdcard1/backup/protect_s
echo "backup ebr"
dd if=/dev/block/mmcblk0p1 of=/storage/sdcard1/backup/ebr
echo "backup system"
dd if=/dev/block/mmcblk0p5 of=/storage/sdcard1/backup/system  
echo 'done'

exit
echo "backup data"
dd if=/dev/block/mmcblk0p7 of=/storage/sdcard1/backup/data.img
echo "backup cache"
dd if=/dev/block/mmcblk0p6 of=/storage/sdcard1/backup/cache
echo "backup bootimg"
dd if=/dev/bootimg of=/storage/sdcard1/backup/bootimg
