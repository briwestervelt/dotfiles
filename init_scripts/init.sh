#!/usr/bin/env bash

SCRIPT_PATH=$(dirname $(realpath $0))
TMP_SR_DIR="TMP_SW"
PARU_REPO="https://aur.archlinux.org/paru.git"
LOGFILE="install_$(printf '%(%Y_%m_%d__%H_%M_%S)T\n').log"

SETTINGS_DIR=${SCRIPT_PATH}/settings
BASE_PAC_FILE=${SETTINGS_DIR}/packages_base_pacman
BASE_AUR_FILE=${SETTINGS_DIR}/packages_base_aur
NV_PAC_FILE=${SETTINGS_DIR}/packages_nvidia_pacman
NV_AUR_FILE=${SETTINGS_DIR}/packages_nvidia_aur
SERVICES_FILE=${SETTINGS_DIR}/services

USER_NO=0
USER_YES=1

log_info () { echo "[INFO] $@" | tee -a $LOGFILE; }
log_warn () { echo "[WARN] $@" | tee -a $LOGFILE; }
log_error () { echo "[ERROR] $@" | tee -a $LOGFILE; }

run_cmd () {
    echo "[CMD] $@" | tee -a $LOGFILE
    #eval "$@"
    [ $? == 0 ] || log_warn Prev cmd failed!
}

ask_yes_no () {
    read -p "[QUESTION] $@ " user_answer
    case $user_answer in
        y|Y|yes|Yes|YES)
            echo "[QUESTION] $@ - YES" >> $LOGFILE
            return $USER_YES
            ;;
        *)
            echo "[QUESTION] $@ - NO" >> $LOGFILE
            return $USER_NO
            ;;
    esac
}

install_package_file () {
    run_cmd $1 -S $(cat $2)
}

init_service () {
    run_cmd sudo systemctl enable "$@"
    run_cmd sudo systemctl start "$@"
}

log_info Running from \"$SCRIPT_PATH\"

if [ $UID == 0 ]; then
    log_error User is root - please run as your normal user
    exit 1
elif $(sudo -l &> /dev/null); then
    log_info User has sudo - continuing
else
    log_error User does not have sudo/root privilege - exiting
    exit 1
fi

log_info Updating system packages
run_cmd sudo pacman -Syu

log_info Installing base pacman packages
install_package_file pacman $BASE_PAC_FILE

log_info Installing paru
run_cmd pushd $SCRIPT_PATH
run_cmd mkdir $TMP_SR_DIR
run_cmd cd $TMP_SR_DIR
run_cmd git clone $PARU_REPO
run_cmd cd paru
run_cmd makepkg -si
run_cmd cd ../..
run_cmd rm -rf $TMP_SR_DIR
run_cmd popd

log_info Installing base aur packages
install_package_file paru $BASE_AUR_FILE

ask_yes_no "Do you want to install packages for NVIDIA?"
if [ $? == $USER_YES ]; then
    log_info Installing NVIDIA pacman packages
    install_package_file pacman $NV_PAC_FILE
    log_info Installing NVIDIA aur packages
    install_package_file paru $NV_AUR_FILE
else
    log_info Skipping NVIDIA packages
fi

log_info Linking dotfiles
run_cmd pushd $SCRIPT_PATH
run_cmd stow .
run_cmd popd

log_info Initing services
for service in $(cat $SERVICES_FILE); do
    init_service $service
done

log_info Your system is ready, time to reboot
log_info Have an excellent day

