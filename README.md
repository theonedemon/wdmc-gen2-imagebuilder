1. Clone repository:
```
git@github.com:theonedemon/wdmc-gen2-imagebuilder.git
cd wdmc-gen2-imagebuilder/
```

2. Install Docker https://www.digitalocean.com/community/tutorials/docker-ubuntu-16-04-ru

3. Run Docker in project folder:
```
	docker pull theonedemon/wdmc-gen2-imagebuilder
	docker run -it --mount type=bind,source="$(pwd)"/data,target=/root/data --name wdmcg2ib theonedemon/wdmc-gen2-imagebuilder /bin/bash
	#for second and etc run command: docker start wdmcg2ib -i
```

4. Next commands run in container ( folder /root/data ).

5. Download last stable kernel from https://www.kernel.org/ :
```
	wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.13.5.tar.xz -O /root/data/linux-kernel.tar.xz
```

6. Create folder for kernel source and extract arhive:
```
	rm -Rf /root/data/kernel-src/
	mkdir /root/data/kernel-src/
	tar -xf /root/data/linux-kernel.tar.xz -C /root/data/kernel-src/ --strip-components=1
```

7. Copy config files to `kernel-src` folder:
```
	cd /root/data/kernel-src/
	cp ../config/kernel-4.13.5.config .config
	cp ../config/armada-375-wdmc-gen2.dts arch/arm/boot/dts/
```

8. Compile kernel:
```
	make clean
	make zImage -j2
	make armada-375-wdmc-gen2.dtb

	cat arch/arm/boot/zImage arch/arm/boot/dts/armada-375-wdmc-gen2.dtb > /root/data/dist/zImage_and_dtb

	mkimage -A arm -O linux -T kernel -C none -a 0x00008000 -e 0x00008000 -n 'WDMC-Gen2' -d /root/data/dist/zImage_and_dtb /root/data/dist/uImage
```

9. Compile modules:
```
	make modules
	make -j2 INSTALL_MOD_PATH=/root/data/dist/modules modules_install
```

10. Enjoy you firmware in `data/dist` folder
