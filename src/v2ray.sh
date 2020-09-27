#!/bin/sh

PLATFORM=$1
if [ -z "$PLATFORM" ]; then
    ARCH="64"
else
    case "$PLATFORM" in
        linux/386)
            ARCH="32"
            ;;
        linux/amd64)
            ARCH="64"
            ;;
        linux/arm/v6)
            ARCH="arm32-v6"
            ;;
        linux/arm/v7)
            ARCH="arm32-v7a"
            ;;
        linux/arm64|linux/arm64/v8)
            ARCH="arm64-v8a"
            ;;
        linux/ppc64le)
            ARCH="ppc64le-power8"
            ;;
        linux/s390x)
            ARCH="s390x"
            ;;
        *)
            ARCH=""
            ;;
    esac
fi
[ -z "${ARCH}" ] && echo "Error: Not supported OS Architecture" && exit 1
# Download binary file
V2RAY_FILE="v2ray-linux-${ARCH}.zip"

echo "Downloading binary file: ${V2RAY_FILE}"
wget -O $PWD/v2ray.zip https://github.com/charlieethan/vless-build/releases/latest/download/${V2RAY_FILE} > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Error: Failed to download binary file: ${V2RAY_FILE}" && exit 1
fi
echo "Download binary file: ${V2RAY_FILE} completed"

echo "Prepare to use"
unzip v2ray.zip && rm -rf v2ray.zip
mv v2ray /usr/bin/v2ray && mv v2ctl /usr/bin/v2ctl

chmod +x /usr/bin/v2ray
chmod +x /usr/bin/v2ctl
