#!/bin/bash

# input
my_dir="$(dirname "$0")"
source "${my_dir}/user.config"  # contains netid, email, root_dir
remote="${netid}@hpc05.tudelft.net"

# check if results dir empty
new_job_dirs=$(ssh "$remote" "ls -A ${remote_root_dir}/results/")
if [[ -z $new_job_dirs ]]; then
  echo "Results directory empty"
  exit 0
fi

# collecting results
printf "Collecting results...\n"
rsync -rv --min-size=1 --remove-source-files "${remote}:${remote_root_dir}/results/" "${local_root_dir}/results"
# min-size prevents empty (typically, stdout) files from being copied

# copy results to project drive - FINISH!
#echo
#read -p "Copy results to the project drive? (y/n): " -n 1 -r
#if [[ $REPLY =~ ^[Yy]$ ]]; then
#    rsync -rv "${local_root_dir}/results"
#    echo 'Copied to project drive'
#fi

# after rsync, we remove all results to keep the cluster clean
echo
ssh "$remote" "find ${remote_root_dir}/results/ -type f -size 0 -print"
ssh "$remote" "find ${remote_root_dir}/results/ -type d -mindepth 1 -print"
# prompt for confirmation
read -p "Remove the above empty files and folders from the results directory? (y/n): " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    ssh "$remote" "find ${remote_root_dir}/results/ -type f -size 0 -delete";
    ssh "$remote" "find ${remote_root_dir}/results/ -type d -mindepth 1 -empty -delete";
    echo 'Removed from cluster'
fi

# remove everything from the .temp folder
ssh "$remote" "cd ${remote_root_dir}/.temp; rm -rf *"
