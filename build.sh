docker rm -f ubuntu_with_pytest
docker build  -t ubuntu_with_pytest . 
docker run -dit --net=host -v $(pwd):/home --name=ubuntu_with_pytest ubuntu_with_pytest
# docker rm -f uboot_build