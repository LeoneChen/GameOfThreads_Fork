make -j`nproc`

if [ $? -ne 0 ]; then
  echo "error: make"
  exit
fi
echo "success: make"

sudo make modules_install -j`nproc`

if [ $? -ne 0 ]; then
  echo "error: make modules_install"
  exit
fi
echo "success: make modules_install"

sudo make install -j`nproc`

if [ $? -ne 0 ]; then
  echo "error: make install"
  exit
fi
echo "success: make install"
